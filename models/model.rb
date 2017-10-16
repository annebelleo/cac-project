# preview command - shotgun -p 8080 -o 0.0.0.0
require 'net/http'
require 'json'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'date'

def get_events
    # today = Date.today.strftime("%B %d")
    today = "October 15"
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        event = event.text.gsub(/\s+/, " ")
        events_array.push(event) if event.include?(today)
    end
    if events_array.empty? == false
        events_array.each do |event|
            new_event = event.split(today)[0]
            return new_event
        end
        events_array.push(new_event)
    else
        events_array.push("There are no events today.")
    end
    return events_array[0]
end

def get_date
    date = Date.today.strftime("%B %d, %Y")
    return date
end

def get_links
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    doc.css('b > a')
end