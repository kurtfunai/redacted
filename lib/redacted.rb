require "redacted/version"

module Redacted
  class Redact
    def self.text str
      length = str.length
      "\u2588" * length unless length.zero?
    end

    def self.html str
      length = str.length
      "&#x2588;" * length unless length.zero?
    end
  end
end
