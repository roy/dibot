require 'dibot/client'
require "dibot/commands"
require "dibot/commands/echo"
require "dibot/commands/java"
require "dibot/commands/deploy"

module Dibot
  def self.logger
    @logger ||= Logger.new(ENV['DIBOT_LOGGING'] ? STDOUT : nil)
  end

  def self.logger=(logger)
    @logger = logger
  end
end
