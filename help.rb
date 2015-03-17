require 'yahoo_weatherman'
 
def get_location(location)
client = Weatherman::Client.new
client.lookup_by_location(location)
end
 
weather = get_location('90210')

require 'date'

date = DateTime.now.strftime('%w')
 
weather.forecasts.each do |forecasts|
  puts forecasts['day'].to_s + ' is going to be ' + 
  forecasts['text'].downcase + ' with a low of ' + 
  forecasts['low'].to_s + ' and a high of ' + forecasts['high'].to_s
end
 
 
 