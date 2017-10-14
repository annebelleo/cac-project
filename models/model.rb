# preview command - shotgun -p 8080 -o 0.0.0.0
require 'net/http'
require 'json'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'date'

def get_events
    today = Date.today.strftime("%B %d")
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        new_event = event.text.gsub(/\s+/, " ").gsub("[", " ")
        events_array.push(new_event) if new_event.include?(today)
    end
    return events_array[0]
end
# also get links for events 'b > a'

puts get_events