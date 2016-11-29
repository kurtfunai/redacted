# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redacted/version'

Gem::Specification.new do |spec|
  spec.name          = "redacted"
  spec.version       = Redacted::VERSION
  spec.authors       = ["Kurt Funai"]
  spec.email         = ["me@kurtfunai.com"]
  spec.summary       = "Convert strings into redacted text."
  spec.description   = "Allows a user to turn any string of text into a redacted block of the same size."
  spec.homepage      = "http://kurtfunai.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ffaker", "~> 2.3"
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "railties", ">= 3.2", "< 5.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rails", "~> 4.1"
end
