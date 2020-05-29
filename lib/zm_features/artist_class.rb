#an artist has many features and has a lots of info
#responsible for keeping track of all artists
#establish relationships using the second level scrape
require 'nokogiri'
require 'open-uri'  
#This class will provide instructions for creating new instances of a feature, save it, and display the list of features in the terminal

class Artist
  attr_accessor :name, :country_of_origin, :info, :artist_url, :menu
  # attr_reader :art_piece

  @@all = []

  def initialize(name=nil, country_of_origin=nil, info=nil)
    @name = name
    @country_of_origin = country_of_origin
    @info = []
    @@all << self
  end

  def self.all
    @@all
  end

  # def self.menu
  #   list = ZMFeaturesScraper.scrape_a_feature.each.with_index(1).map do |link, index|
  #     slim = link.delete_prefix("https://zeitzmocaa.museum/artists/")
  #     slimmer = slim.delete_suffix("/")
  #     slimmest = slimmer.gsub(/[-]/, ' ')
  #   end
  # end

  def self.print_all_features
    menu = ZMFeaturesScraper.scrape_a_feature.each.with_index(1) do |link, index|
      slim = link.delete_prefix("https://zeitzmocaa.museum/artists/")
      slimmer = slim.delete_suffix("/")
      slimmest = slimmer.gsub(/[-]/, ' ')
      puts "#{index}. #{slimmest}"
    end
  end

  def artist_url
    @artist_url ||= ZMFeaturesScraper.scrape_a_feature
  end

  def info
    Info.all.select { |info| info.artist == self}
  end

  def add_info(info)
    # @info << info
    info.artist = self
  end

  def self.print_info
    menu = ZMFeaturesScraper.scrape_a_feature.each.with_index(1) do |link, index|
      slim = link.delete_prefix("https://zeitzmocaa.museum/artists/")
      slimmer = slim.delete_suffix("/")
      slimmest = slimmer.gsub(/[-]/, ' ')
    end

    puts ""
    puts "" 
    puts "Please, pick a number from the menu."
    

    input = gets.chomp
    number = input.to_i
    
    artist_link = menu[number - 1]
    
    new_html = open(artist_link)
    new_doc = Nokogiri::HTML(new_html)
    new_results = new_doc.css('div.col-1-1 blockquote')
    new_results.each do |quote|
      blurb = quote.text

      Info.new(@name, blurb)
    end
  end
end