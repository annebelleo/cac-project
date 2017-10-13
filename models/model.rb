# preview command - shotgun -p 8080 -o 0.0.0.0
require 'open-uri'
require 'nokogiri'
require 'date'

today = Date.today
site = open("http://www.orangecounty.net/html/events.html")
doc = Nokogiri::HTML(site)

def get_events(doc)
    events_array = Array.new
    doc.css('font').each do |event|
        events_array.push(event.text)
    end
    # puts events_array.length
    if events_array.include?("October")
        puts events_array
    else
        puts "nope"
    end
end

get_events(doc)

# puts today