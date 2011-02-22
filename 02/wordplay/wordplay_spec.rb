require "wordplay"

describe Wordplay do
  it "says welcome to wordplay" do
    Wordplay.new.message.should == "welcome to wordplay"
  end
  
  it "implement reverse" do
    @play = Wordplay.new
    @play.backwords(@play.message).should == "yalpdrow ot emoclew"
  end
  
  it "tells me how many characters are in a string" do
  Wordplay.new.how_long("how long is this string?").should == 24
  end
  
  it "should delete the vowels from a given string" do
    Wordplay.new.remove("in a galaxy far, far away").should == "n  glxy fr, fr wy"
  end
  
  it "should make all of the string capitals" do
    Wordplay.new.make_big("make it so number one").should == "MAKE IT SO NUMBER ONE"
  end

end
