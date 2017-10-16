# preview command - shotgun -p 8080 -o 0.0.0.0
require 'net/http'
require 'json'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'date'

def get_first_event
    # day = Date.today.strftime("%d")
    day = "15"
    month = Date.today.strftime("%B")
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        event = event.text.gsub(/\s+/, " ")
        events_array.push(event) if event.include?(month) && event.include?(day)
    end
    if events_array.empty? == false
        events_array.each do |event|
            new_event = event.split(month)[0]
            return new_event
        end
        events_array.push(new_event)
    else
        events_array.push("There are no events today.")
    end
end

def get_second_event
    # day = Date.today.strftime("%d")
    day = "15"
    month = Date.today.strftime("%B")
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        event = event.text.gsub(/\s+/, " ")
        events_array.push(event) if event.include?(month) && event.include?(day)
    end
    if events_array.empty? == false
        new_event = " "
        events_array.each do |event|
            i = 0
            if i == 1
                puts "this works on the erb but not in the terminal"
                new_event = event.split(" ")
                return new_event
            else
                puts ""
            end
            i += 1
        end
        events_array.push(new_event)
    else
        events_array.push("There are no events today.")
    end
    return events_array[1]
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