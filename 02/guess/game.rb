module Game
class Guess
def initialize (output)
@output = output
end
def start
@output.puts "would you like to guess a number?"
@output.puts "what is your guess?"
end
def compare guess
  @output.puts "wrong"
  end
end
end