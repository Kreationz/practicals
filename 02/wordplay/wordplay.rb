class Wordplay
  attr_accessor :message
  def initialize
    @message = "welcome to wordplay"
  end
  
  def backwords message
    @message = message.reverse
  end
  def how_long message
    @message = message.length
  end
  def remove message
    @message = message.delete "aeiou"
  end
  def make_big message
    @message = message.upcase
  end
end