module Dibot
  class Commands::Echo
    PARSER = /echo/i

    def call(message)
      "ECHO: #{message[:body].gsub(PARSER, "")}"
    end
  end
end

Dibot::Commands.register Dibot::Commands::Echo
