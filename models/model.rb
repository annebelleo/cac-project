# preview command - shotgun -p 8080 -o 0.0.0.0
require 'net/http'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'date'

def get_first_event
    
    #date variables
    d = Time.now.getlocal("-07:00") 
    day = d.strftime("%d")
    # day = "17"
    month_name = d.strftime("%B")
    today = Date.today
    last_month = today << 1
    prev_month = last_month.strftime("%B")
    
    #parsing
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        event = event.text.gsub(/\s+/, " ")
        events_array.push(event) if event.include?(month_name) && event.include?(day)
    end
        
    if events_array.empty? == false
        events_array.each do |event|
            if event.include?(prev_month)
                new_event = event.split(prev_month)[0]
            else
                new_event = event.split(month_name)[0]
            end
            return new_event
        end
        events_array.push(new_event)
        return events_array[0]
    else
        message = "There are no events today."
        events_array.push(message)
        return events_array[0]
    end
end

def get_second_event
    
    #date variables
    d = Time.now.getlocal("-07:00") 
    day = d.strftime("%d")
    # day = "17"
    month_name = d.strftime("%B")
    today = Date.today
    last_month = today << 1
    prev_month = last_month.strftime("%B")
    
    #parsing
    site = open("http://www.orangecounty.net/html/events.html")
    doc = Nokogiri::HTML(site)
    events_array = Array.new
    doc.css('p').each do |event|
        event = event.text.gsub(/\s+/, " ")
        events_array.push(event) if event.include?(month_name) && event.include?(day)
    end
    
    if events_array.length > 1
        event1 = events_array[1]
        if event1.exclude?(prev_month)
            message = " "
            events_array.push(message)
        elsif event1.include?(prev_month)
            new_event = event1.split(prev_month)[0]
        else
            new_event = event1.split(month_name)[0]
        end
        events_array.clear
        events_array.push(new_event)
        return events_array[0]
    else
        events_array.clear
        message = " "
        events_array.push(message)
        return events_array[0]
    end
end

def get_date
    d = Time.now.getlocal("-07:00")
    return d.strftime("%B %d, %Y")
end