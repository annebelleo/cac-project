require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class MyApp < Sinatra::Base
  get '/' do
    @cities=["http://www.orangecounty.net/html/events.html", "http://www.cityofalisoviejo.com/city-hall/departments/parks-recreation/special-events/", "http://www.anaheim.net/calendar.aspx?CID=14&showPastEvents=false", "http://www.ci.brea.ca.us/index.aspx?NID=448", "http://www.cypressca.org/play/event-calendar", "http://www.danapoint.org/residents/events-activities", "http://cityofmissionviejo.org/events?combine=&field_date_value_1%5Bvalue%5D%5Bdate%5D=&field_date_value2%5Bvalue%5D%5Bdate%5D=&field_event_category_tid=78"]
    @data=[]
    @cities.each do |city_site|
      @data.push(get_event("http://www.cityofalisoviejo.com/city-hall/departments/parks-recreation/special-events/"))
    end
    erb :index
  end
  
end