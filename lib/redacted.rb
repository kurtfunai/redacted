require "redacted/version"
require 'redacted/engine.rb' if defined?(Rails)
require 'redacted/railtie.rb' if defined?(Rails)
require "faker"

module Redacted
  class Redact
    def self.text str
      length = str.length
      "\u2588" * length unless length.zero?
    end

    def self.html str
      Faker::Lorem.characters(str.length) unless str.length.zero?
    end
  end
end

