module Dibot
  module Commands
    class << self
      attr_accessor :commands

      def register(command = nil, &block)
        @commands ||= []
        @commands << command if command
        @commands << block if block
      end
    end
  end
end
