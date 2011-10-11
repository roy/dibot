$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

# setup
require "rubygems"
require "bundler/setup"

# third party
require "tinder"
require "logger"

# own stuff
require 'dibot'
