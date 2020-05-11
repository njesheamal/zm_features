#Handles the logic of the app, the methods are all the things that go into the console

class ZMFeatures::CLI

  attr_accessor :username

  def greet
    "Welcome to the Zeitz Museum of Contemporary Art Africa Features (MOCAA) App!".each_char {|c| putc c ; sleep 0.07; $stdout.flush }

    puts ""
    puts ""

    puts "What is your name?"

  end

  def get_name
    name = gets.chomp
    self.username = name
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Hi, #{self.username}."
    # system("clear")
  end

  def begin_to_scrape
    "The scraping process will commence shortly. Your patience is appreciated.".each_char {|c| putc c ; sleep 0.07; $stdout.flush }
    ZMFeaturesScraper.scrape_and_make
    puts "Process Complete!"
  end

  def prompt_to_learn_more
    puts "Would you like to learn more about a specific artist being featured?"
    #I would need to get input from the user
    #Then, based on what they choose, one of two things could happen
    # 1. if yes - i direct them to input the name of the artist from the list
    # *puts "Great!"
    # *puts "Here is some trivia info:"
    # *display the second level scrape
    #    -find a way to work around the "art by..." issue
    # 2. if no, - thank them for stopping by
  end

  def run
    system("clear")
    greet
    get_name
    begin_to_scrape
    Feature.print_all_features
  end
end
