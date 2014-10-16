module Redacted
  module ActionView
    module Helpers
      def redact_text str
        length = str.length
        "\u2588" * length unless length.zero?
      end

      def redact_html str
        return '' unless str
        "<span class=\"redacted-text\">#{generate_fake_text(str)}</span>".html_safe
      end

      def generate_fake_text(str)
        word_count = str.split.size
        fake_text = Faker::Lorem.words(word_count).join(' ')
        fake_text << Faker::Lorem.characters(str.length - fake_text.length) if str.length > fake_text.length
        fake_text.slice(0, str.length)
      end
    end
  end
end
