#environment file
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./zm_features/version"
require_relative "./zm_features/cli_class"
require 'bundler/setup'
Bundler.require


# require_all './zm_features/lib'

module ZMFeatures
  class Error < StandardError; end
  # Your code goes here...
end
