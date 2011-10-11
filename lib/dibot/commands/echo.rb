module Dibot
  class Commands::Echo
    def call(room, message)
      return unless message[:body] =~ /echo/i

      room.speak "ECHO:#{message[:body].gsub(/echo/i, "")}"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Echo.new
