module Redacted
  module ActionView
    module Helpers
      def ascii_redact str
        length = str.length
        "\u2588" * length unless length.zero?
      end

      def redact str
        if str.include?("\n")
          redact_paragraphs(str).join('').html_safe
        else
          redact_text(str).html_safe
        end
      end

      def redact_paragraphs str
        str.lines.map do |l|
          "<p>#{redact_text(l.chomp)}</p>" if l.chomp.present?
        end.reject{|l|l.nil?}
      end

      def redact_text str
        return '' unless str
        "<span class=\"redacted-text\">#{generate_fake_text(str)}</span>"
      end

      def redact_html html_str
        doc = Nokogiri::HTML::DocumentFragment.parse(html_str)
        doc.traverse do |ele|
          ele.replace(redact_text(ele.content.chomp)) if ele.text?
        end
        doc.to_html
      end

      private
      def generate_fake_text str
        word_count = str.split.size
        fake_text = FFaker::Lorem.words(word_count).join(' ')
        fake_text << FFaker::Lorem.characters(str.length - fake_text.length) if str.length > fake_text.length
        fake_text.slice(0, str.length)
      end
    end
  end
end
