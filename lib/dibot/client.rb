module Dibot
  class Client
    def initialize(subdomain, token, room = nil)
      config = YAML.load(File.open(File.expand_path("~/.dibot")))

      @campfire = Tinder::Campfire.new subdomain, :token => token
      @room = @campfire.rooms.first

      Dibot::Commands::Deploy.establish_connection config["webistrano"]
    end

    def run
      @room.speak "hello there"

      @room.listen do |message|
        next if message[:user][:name] == "dibot"

        Dibot::Commands.commands.each do |command|
          command.call(@room, message)
        end
      end
    end
  end
end
