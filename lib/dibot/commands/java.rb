module Dibot
  class Commands::Java
    PARSER = /java/i

    def call(message)
      return unless message[:body] =~ PARSER
      
      "Java?? WTF!!"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Java
