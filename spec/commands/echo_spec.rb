require "spec_helper"

describe Dibot::Commands::Echo do
  before :each do
    @command = Dibot::Commands::Echo.new
    @room = mock("room")
  end

  it "echo's when sentence starts with echo" do
    @room.should_receive(:speak).with("ECHO: stuff")
    @command.call(@room, {:body => "echo stuff"})
  end
end
