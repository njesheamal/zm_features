#This is responsible for scraping and making reviews

class ZMFeaturesScraper
  def self.scrape_and_make
    site = "https://zeitzmocaa.museum/art-artists/"

    html = open(site)

    page = Nokogiri::HTML(html)

    results = page.css("div.col-1-4.artist-block")

    results.each do |artist|
      name = artist.css('h2.border-strip').text
      # maybe create an actual Artist class
      # artist = Artist.create(name)
      # is it sufficient to say that the name belongs to the artist?
      country_of_origin = artist.css('p').text
      Feature.new(name, country_of_origin)
      #if an artist class and exhibitions class is added, new_features = Features.new(name, country_of_origin, exhibitions)
    end
  end

  def self.scrape_a_feature
    url = "https://zeitzmocaa.museum/art-artists/"
    html = open(url)
    parsed_elements = Nokogiri::HTML(html)
    results = parsed_elements.css("div.col-1-4.artist-block")
    #now, locate where the actual info I need is:
    artist_url = results.css("a").map { |link| link["href"]}

    artist_url.uniq
  end

end
