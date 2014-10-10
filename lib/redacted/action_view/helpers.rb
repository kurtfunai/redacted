module Redacted
  module ActionView
    module Helpers
      def redact_text str
        length = str.length
        "\u2588" * length unless length.zero?
      end

      def redact_html str
        return '' unless str
        "<span class=\"redacted-text\">#{Faker::Lorem.characters(str.length)}</span>".html_safe
      end
    end
  end
end
