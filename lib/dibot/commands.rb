module Dibot
  module Commands
    class << self
      attr_accessor :commands

      def register(command)
        @commands ||= []
        @commands << command
      end
    end
  end
end
