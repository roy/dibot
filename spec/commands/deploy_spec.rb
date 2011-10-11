require "spec_helper"

describe Dibot::Commands::Deploy do
  before :each do
    @command = Dibot::Commands::Deploy.new
    @room = mock("room")
  end

  it "should establish connection" do
    config = {
      "webistrano" => {
        "server" => "http://example.com",
        "user" => "example_user",
        "password" => "example_password"
      }
    }

    Dibot::Commands::Deploy.establish_connection(config["webistrano"])
    Dibot::Commands::Deploy.connection["user"].should == "example_user"
    Dibot::Commands::Deploy.connection["password"].should == "example_password"
    Dibot::Commands::Deploy.connection["server"].should == "http://example.com"

    Dibot::Commands::Deploy.new.connection["user"].should == "example_user"
  end

  it "should match dibot deploy project" do
    @command.match("dibot deploy athena")
    @command.project.should == "athena"
  end

  it "should deploy project" do
    @command.stub!(:deploy).and_return("")
    @room.should_receive(:speak).with("deploying athena")
    @command.call(@room, {:body => "dibot deploy athena"})
  end
end
