module Dibot
  class Commands::Java
    PARSER = /java/i

    def call(body)
      "Java?? WTF!!"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Java
