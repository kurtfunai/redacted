module Redacted
  module ActionView
    module Helpers
      def ascii_redact str
        length = str.length
        "\u2588" * length unless length.zero?
      end

      def redact str
        str.lines.map do |l|
          redacted_html(l.chomp) if l.chomp.present?
        end.reject{|l|l.nil?}
      end

      def redacted_html str
        return '' unless str
        "<span class=\"redacted-text\">#{generate_fake_text(str)}</span>".html_safe
      end

      private
      def generate_fake_text str
        word_count = str.split.size
        fake_text = Faker::Lorem.words(word_count).join(' ')
        fake_text << Faker::Lorem.characters(str.length - fake_text.length) if str.length > fake_text.length
        fake_text.slice(0, str.length)
      end
    end
  end
end
