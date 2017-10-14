require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    get_events
  end
  
end