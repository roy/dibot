module Dibot
  class Commands::Java
    def call(room, message)
      return unless message[:body] =~ /java/i
      
      room.speak "Java?? WTF!!"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Java.new
