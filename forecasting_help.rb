
# puts client.class => Weatherman::Client

# puts weather.class => Weatherman::Response

# puts weather.forecasts.class => Array

# puts forecast_array.class => Array




require "yahoo_weatherman"

client = Weatherman::Client.new
weather = client.lookup_by_location('93003')

forecast_array = weather.forecasts

forecast_array.each do |forecast|
	puts forecast['day'] + ' is going to be ' + forecast['text'].downcase + 
	' with a low of ' + forecast['low'].to_s + ' and a high of ' + 
	forecast['high'].to_s + '.'

end




#need to return 5 days worth of forecasts
#need to include the day, text, low, and high

#puts '#{day} is going to be #{text} with a low of #{low}
#and a high of #{30} degrees celsius.'
