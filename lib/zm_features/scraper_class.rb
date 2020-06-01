#This is responsible for scraping and making reviews

class ZMFeaturesScraper
 
  def self.scrape_and_make
    results = ZMFeaturesScraper.scraper.css("div.col-1-4.artist-block")

    results.each do |artist|
      name = artist.css('h2.border-strip').text
      country_of_origin = artist.css('p').text
      Artist.new(name, country_of_origin)
    end
  end

  
  def self.scrape_a_feature
    results = ZMFeaturesScraper.scraper.css("div.col-1-4.artist-block")
    url = results.css("a").map { |link| link["href"]}
    url.uniq
  end

  def self.scraper
    site = "https://zeitzmocaa.museum/art-artists/"
    html = open(site)
    parsed_elements = Nokogiri::HTML(html)
  end

end