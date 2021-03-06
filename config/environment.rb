require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'tty-table'

require_relative "../lib/ww_finder/version"
require_relative "../lib/ww_finder/cli"
require_relative "../lib/ww_finder/scraper"
require_relative "../lib/ww_finder/building"
require_relative "../lib/ww_finder/city"
require_relative "../lib/ww_finder/country"
require_relative "../lib/ww_finder/continent"

module WWFinder
  class Error < StandardError; end
  # Your code goes here...
end
