module Dibot
  class Client
    def initialize(config)
      Dibot::Commands::Deploy.establish_connection config["webistrano"]

      @campfire = Tinder::Campfire.new config["campfire"]["subdomain"], :token => config["campfire"]["token"]
      @room = @campfire.rooms.first

      @room.speak "Initializing..."
    end

    def run
      @room.listen do |message|
        next if message[:user][:name] == "dibot"

        Dibot::Commands.commands.each {|x| x.call(@room, message) } 
      end
    end
  end
end
