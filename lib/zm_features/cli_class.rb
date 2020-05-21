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

    puts ""
    puts ""
    ZMFeaturesScraper.scrape_and_make

    puts ""
    puts ""
    puts "Process Complete!".each_char {|c| putc c ; sleep 0.07; $stdout.flush }
    puts ""
    puts ""
  end

  def prompt_to_learn_more
    puts ""
    puts ""
    puts ""
    puts "Displayed above is the list of artists featured at the Zeitz MOCAA!".each_char {|c| putc c ; sleep 0.07; $stdout.flush }
    puts ""
    puts ""
    puts "Would you like to learn more about a specific artist being featured? Enter Y or N"
    #I would need to get input from the user
    input = gets.strip.downcase
    if input == "y"
      puts ""
      puts ""
      puts ""
      puts "Great!"
      get_artist_name
    elsif input == "n"
      puts ""
      puts "Ok, thanks for stopping by!"
    else
      puts ""
      puts "Sorry, I don't understand the answer."
      puts "Please try again"
      prompt_to_learn_more
    end
  end

  def get_artist_name
    puts "Who would you like to learn more about?"

    input = gets.strip.downcase
    puts "Ok, #{input.upcase} is a great choice!".each_char {|c| putc c ; sleep 0.07; $stdout.flush }
    
    puts "Here is some trivia info about 'em! :"
    puts ""
    puts ""
    if Info.print_info.include(input)
      return Info.print_info
    end

    puts ""
    puts ""
    puts "Would you like to learn more about someone else?"
    more_input = gets.strip.downcase
    if more_input == "y"
      get_artist_name
    else
      system("clear")
      puts "Ok, thanks for stopping by!" 
    end
  end


  def run
    system("clear")
    greet
    get_name
    begin_to_scrape
    Artist.print_all_features
    prompt_to_learn_more
  end
end
