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

    while input != "exit"
      Artist.print_all_features
      Artist.print_info

      if input == "y" || "Y" || "Yes" || "yes" || "YES"
        puts ""
        puts ""
        puts "Great!"
        puts ""
        puts ""
        system("clear")
        puts ""
        puts ""
        Info.print_info
        puts ""
        puts ""
        system("clear")
        display_more
      elsif input == "n" || "N" || "No" || "no" || "NO"
        puts ""
        puts "Ok, thanks for stopping by!"
        system("clear")
        greet
      else
        puts ""
        puts "Sorry, I don't understand the answer."
        puts "Please try again"
        prompt_to_learn_more
      end
    end
  end

  def display_more
    puts ""
    puts ""
    puts "Would you like to view more Y or N?"
    input = gets.strip.downcase
    if input == "y" || "Y" || "Yes" || "yes" || "YES"
      puts ""
      puts ""
      system("clear")
      puts ""
      puts ""
      prompt_to_learn_more
      puts ""
      puts ""
    elsif input == "n" || "N" || "No" || "no" || "NO"
      puts ""
      puts "Ok, thanks for stopping by!"
      system("clear")
      greet
    else
      puts ""
      puts "Sorry, I don't understand the answer."
      puts "Please try again"
      prompt_to_learn_more
    end
  end

  # def say_hello(name)
  #   if name != "femi kuti"
  #     puts "goodbye"
  #   else
  #     puts "hello"
  #   end
  # end

  def run
    system("clear")
    greet
    get_name
    begin_to_scrape
    Artist.print_all_features
    prompt_to_learn_more
  end
end

#Start-
#- greet the user
#- ask for their name(one)
#- tell them what the program does
#- ask for patience as scraping occurs
#- show them a menu (two)
#- ask them if they would like to get more information about any artist
#- if yes..
#-- show the menu again
#-- ask them to make a selection(three)
#-- display the artist info
#-- ask them if they would like more info about the same artist or if they would like to choose another one
#---- if more of the same artist, show them more details
#---- if another artist, then (three)
#- if no...
#-- thank them for their time, ask them to come back soon
#* instead of ending, go back to start again and greet the user