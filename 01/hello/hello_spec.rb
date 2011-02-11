require "hello"

describe Hello do
  it "says hello" do
    Hello.new.message.should == "hello world"
  end
  
  it "says hello to someone" do
    Hello.new("Bob").message.should == "hello, Bob"
  end
end
