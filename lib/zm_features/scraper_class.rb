#This is responsible for scraping and making reviews

class ZMFeaturesScraper
 

    results.each do |artist|
      name = artist.css('h2.border-strip').text
      # maybe create an actual Artist class
      # artist = Artist.create(name)
      # is it sufficient to say that the name belongs to the artist?
      country_of_origin = artist.css('p').text
      Artist.new(name, country_of_origin)
      # if an artist class and exhibitions class is added, new_features = Features.new(name, country_of_origin, exhibitions)
    end
  end


  def self.scrape_a_feature
    site = "https://zeitzmocaa.museum/art-artists/"
    html = open(site)
    parsed_elements = Nokogiri::HTML(html)
    results = parsed_elements.css("div.col-1-4.artist-block")
  end

  # def self.scrape_a_feature
  #   site = "https://zeitzmocaa.museum/art-artists/"
  #   html = open(site)
  #   parsed_elements = Nokogiri::HTML(html)
  #   results = parsed_elements.css("div.col-1-4.artist-block")
  #   #now, locate where the actual info I need is:

  #   # url = results.css("a").map { |link| link["href"]}

  #   # url.uniq
  
  #   # menu = artist_url.each.with_index(1) do |link, index|
  #   #   slim = link.delete_prefix("https://zeitzmocaa.museum/artists/")
  #   #   slimmer = slim.delete_suffix("/")
  #   #   slimmest = slimmer.gsub(/[-]/, ' ')
  #   #   puts "#{index}.: #{slimmest}"
  #   # end
    
    
  #   # puts ""
  #   # puts "" 
  #   # puts "Please, pick a number from the menu."
    

  #   # input = gets.chomp
  #   # number = input.to_i
    

  #   # artist_link = menu[number - 1]
    
  #   # new_html = open(artist_link)
    
  #   # new_doc = Nokogiri::HTML(new_html)

  #   # new_results = new_doc.css('div.col-1-1 blockquote')

  #   # new_results.each do |quote|
  #   #   blurb = quote.text

  #   #   Info.new(blurb)
  #   # end
  def self.scrape_a_feature
    site = "https://zeitzmocaa.museum/art-artists/"
    html = open(site)
    parsed_elements = Nokogiri::HTML(html)
    results = parsed_elements.css("div.col-1-4.artist-block")
  end

end