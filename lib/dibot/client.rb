module Dibot
  class Client
    def initialize(subdomain, token, room = nil)
      @campfire = Tinder::Campfire.new subdomain, :token => token
      @room = @campfire.rooms.first
    end

    def run
      @room.speak "hello there"

      @room.listen do |message|
        next if message[:user][:name] == "dibot"

        Dibot::Commands.commands.each do |command|
          @room.speak command.call(message)
        end
      end
    end
  end
end
