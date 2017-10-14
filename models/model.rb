# preview command - shotgun -p 8080 -o 0.0.0.0
require 'open-uri'
require 'nokogiri'
require 'date'

today = Date.today.strftime("%B %d")
site = open("http://www.orangecounty.net/html/events.html")
doc = Nokogiri::HTML(site)

def get_events(doc, date)
    events_array = Array.new
    doc.css('p').each do |event|
        new_event = event.text.gsub(/\s+/, " ")
        events_array.push(new_event) if new_event.include?(date)
    end
    puts events_array
end

get_events(doc, today)
# puts today

# puts today
# also get links for events 'b > a'