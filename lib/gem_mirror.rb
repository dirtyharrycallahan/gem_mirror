# frozen_string_literal: true

require "confstruct"
require "httpclient"
require "digest/sha2"
require "fileutils"
require "logger"
require "rubygems"
require "rubygems/user_interaction"
require "rubygems/indexer"
require "stringio"
require "slop"
require "zlib"

$LOAD_PATH.unshift(File.expand_path(__dir__)) unless $LOAD_PATH.include?(File.expand_path(__dir__))

Dir["./lib/**/*.rb"].sort.each do |file|
  require file
end
