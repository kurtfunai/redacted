require 'simplecov'
SimpleCov.start

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "pry"

Rails.backtrace_cleaner.remove_silencers!
