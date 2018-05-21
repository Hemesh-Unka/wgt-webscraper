require 'open-uri'
require 'nokogiri'

class Scrape
  def self.url(url)
    Nokogiri::HTML(open(url))
  end
end
