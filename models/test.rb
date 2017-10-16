require 'open-uri'
require 'nokogiri'

def get_links
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    puts doc.css('b > a')
end

get_links