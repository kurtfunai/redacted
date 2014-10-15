module Redacted
  module ActionView
    module Helpers
      def redact_text str
        length = str.length
        "\u2588" * length unless length.zero?
      end

      def redact_html str
        return '' unless str
        word_count = str.split.size
        fake_text = Faker::Lorem.words(word_count).join(' ')
        "<span class=\"redacted-text\">#{fake_text.slice(0, str.length)}</span>".html_safe
      end
    end
  end
end
