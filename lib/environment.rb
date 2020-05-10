#environment file
require "zm_features/version"
require 'bundler/setup'
Bundler.require
require 'open-uri'
require 'pry'

require_all 'lib'

module ZmFeatures
  class Error < StandardError; end
  # Your code goes here...
end
