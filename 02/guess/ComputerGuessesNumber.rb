# Robert Gauld
# This is my own work.
# Information on using colour in the console was gained from
# http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/

# A program to demonstrate:
#   * Prompting the user for information using the console

# The idea is simple the human player picks a number between values (inclusive) and
# the computer guesses numbers. The computer keeps track of the current upper and lower
# bounds of what the number could be and guesses the number in the middle. This methos
# allows us to guess the number in log2(highest number) guesses or less.

# If you want to use your own low number and high number then specify them as arguments
# 0 and 1 on the command line, if you don't then the built in defaults will be used.
# e.g. ruby script.rb 10 100

number_high = (ARGV[1].to_i != 0) ? ARGV[1].to_i : 1000   # If high num not specified on command line then set to a default
number_low = (ARGV[0].to_i != 0) ? ARGV[0].to_i : 1       # If low num not specified on command line then set to a default
guesses_est = Math.log2(number_high - number_low).ceil.to_i # Estimated guesses needed


def put_instructions
  puts 'When I guess tell me:'
  puts "\t\e[1;33m-1\e[0m if I guessed too low"
  puts "\t\e[1;33m1\e[0m  if I guessed too high"
  puts "\t\e[1;33m0\e[0m  if I guessed correctly"
end


puts 'Hello, welcome to the number guessing game.'
puts "You're going to pick a number between #{number_low} and #{number_high}, I have to guess it."
puts "I should be able to guess it in #{guesses_est} guesses or less."
puts  # Get some space
put_instructions


gotit = 0   # Flag to indicate if the number has been correctly guessed
guesses = 0 # Number of guesses had so far
while (gotit == 0)
  #puts "\t#{number_low}\t#{number_high}"  # Used for debugging
  number_guessed = number_low + ((number_high - number_low) / 2)
  puts "Is it #{number_guessed}?"
  case ($stdin.gets.to_i)   # Have to use $stdin here as we're allowing arguments to be passed to the script
    when -1
      # We guessed too small
      if (number_guessed >= number_low)
        number_low = number_guessed + 1
        guesses += 1
      else
        # The human is cheating
        cheat = 1
      end

    when 1
      # We guessed too large
      if (number_guessed <= number_high)
        number_high = number_guessed - 1
        guesses += 1
      else
        # The human is cheating
        cheat = 1
      end

    when 0
      # We guessed right
      guesses += 1
      puts "\e[1;31mY\e[1;32mI\e[1;33mP\e[1;34mP\e[1;35mE\e[1;36mE\e[0m \e[1;31m!\e[1;32m!\e[1;33m!\e[1;34m!\e[1;35m!\e[1;36m!\e[0m"
      puts "Only #{guesses} guesses needed."
      gotit = 1

    else
      puts 'Oops, that\'s not a valid response.'
      put_instructions
  end
  
  if (number_high < number_low)
    cheat = 1
  end
  
  if (cheat == 1)
    puts 'I don\'t play with cheats, goodbye!'
    gotit = 1
  end
end

puts "" #Space after script is done