# preview command - shotgun -p 8080 -o 0.0.0.0
require 'open-uri'
require 'nokogiri'
require 'date'

today = Date.today
site = open("http://www.orangecounty.net/html/events.html")
doc = Nokogiri::HTML(site)

def get_events(doc)
    i = 0
    events_array = Array.new
    doc.css('font').each do |event|
        new_event = event.text.gsub(/\s+/, " ")
        events_array.push(new_event)
        i += 1
        puts new_event if new_event.include?("October ")
    end
end

get_events(doc)

# puts today