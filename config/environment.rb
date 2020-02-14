require 'pry'
require 'nokogiri'
require 'colorize'

require_relative "../lib/ww_finder/version"
require_relative "../lib/ww_finder/cli"
require_relative "../lib/ww_finder/scraper"
require_relative "../lib/ww_finder/building"

module WwFinder
  class Error < StandardError; end
  # Your code goes here...
end
