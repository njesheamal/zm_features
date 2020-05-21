#an artist has many features and has a lots of info
#responsible for keeping track of all artists
#establish relationships using the second level scrape
require 'nokogiri'
# require 'open-uri'  - might or might not need this here

#This class will provide instructions for creating new instances of a feature, save it, and display the list of features in the terminal

class Artist
  attr_accessor :name, :country_of_origin, :info
  # attr_reader :art_piece

  @@all = []

  def initialize(name, country_of_origin, info=nil)
    @name = name
    @country_of_origin = country_of_origin
    # @art_piece
    @info = info
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all_features
    puts ""
    puts ""
    puts "      Now Featured at the Zeitz MOCAA:      "
    self.all.each do |artist|
      puts "-------------------------------------------"
      puts artist.name
      puts "From " + artist.country_of_origin
      puts "-------------------------------------------"
    end
  end

  def add_feature_by_name(name)
    feature = Feature.new(name)
    add_feature
  end

  def add_feature(feature)
    feature.artist = self
  end

  def add_info(info)
    info.artist = self
  end

  def blurbs
    Info.all.select { |info| info.artist == self }
  end

  def features
    Feature.all.select { |feature| feature.artist == self }
  end

end

#Potential fix for art instead of artist, the sections commented out above apply to this too:
    # if artist.css('h2.border-strip').text.include?("by")
    #   art_piece = artist.css('h2.border-strip').text
    # else
    #   name = artist.css('h2.border-strip').text
    # end

  #Could Do this:
    # def puts_reviews_name
    #   #puts "One of the artist's featured at the Zeitz Museum of Contemporary African Art is #{self.name}"
    #   #puts "One of the artist's featured at the Zeitz Museum of Contemporary African Art is #{name}"
    #   #puts "One of the artist's featured at the Zeitz Museum of Contemporary African Art is #{@name}"
    # end
