#environment file
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./zm_features/version"
require_relative "./zm_features/cli_class"
require_relative "./zm_features/scraper_class"
require_relative "./zm_features/artist_class"
require_relative "./zm_features/info_class"
require 'bundler/setup'
Bundler.require


# require_all '../lib'

module ZMFeatures
  class Error < StandardError; end
  # Your code goes here...
end
