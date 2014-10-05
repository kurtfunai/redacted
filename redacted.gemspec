# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redacted/version'

Gem::Specification.new do |spec|
  spec.name          = "redacted"
  spec.version       = Redacted::VERSION
  spec.authors       = ["Kurt Funai"]
  spec.email         = ["jesuiskurt@gmail.com"]
  spec.summary       = "Convert strings into redacted text."
  spec.description   = "Allows a user to turn any string of text into a redacted block of the same size."
  spec.homepage      = "http://kurtfunai.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faker", "~> 1.4"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", '~> 3.1'
end
