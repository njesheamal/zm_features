# #belong to artists
# #responsible for grabbing a blurb from the artist's URL and displaying it to the user.
# #an artist has many features and has a lots of info
# #responsible for keeping track of all artists
# #establish relationships using the second level scrape
require 'nokogiri'
require 'open-uri' 
#
# #This class will provide instructions for creating new instances of a feature, save it, and display the list of features in the terminal
#
class Info
  attr_accessor :artist, :blurb, :source
  # attr_reader :art_piece

  @@all = []

  def initialize(artist, blurb)
    @artist = artist
    @blurb = blurb
    @@all << self
  end

  def self.all
    @@all
  end

  def self.artist
    self.artist.name
  end

  def self.print_source
    puts "From zeitzmocaa.museum"
  end


  def self.print_info
    puts ""
    puts ""
    self.all.each do |info|
      puts info.artist
      puts ""
      puts info.blurb
      puts ""
      puts ""
      puts "#{print_source}"
    end
  end

end