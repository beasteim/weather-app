#create a method that uses user input to find the 
#weather for that location

require 'date'
require 'yahoo_weatherman'

#first want to take the input and feed it into the gem
def find_locations_weather(user_location) 
	#get degrees Fahrenheit
	client = Weatherman::Client.new
	response = client.lookup_by_location(user_location).condition['temp']
	response = response*1.8 + 32
	
	#find out what climate is like
	if response >= 80 then
		puts "Head to the beach 'cuz it's sunny outside!"
	elsif response >= 55 then	
		puts "Throw on your snuggie because it's going to be cloudy!"
	elsif response >= 33 then 
		puts "Rain today. Don't forget your cute rainboots!"
	else response <32 
		puts "Snow day! Prepare for sledding!"
	end
	
end

def find_forecast(user_location)
	client = Weatherman::Client.new
	weather = client.lookup_by_location(user_location)

	today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

require 'date'

day = forecast['date'] 

weekday = day.strftime('%w').to_i

if weekday == today
	dayName = 'Today'
	elsif weekday == today + 1
	dayName = "Tomorrow"
	else	
	dayName = day.strftime('%A')
end 

puts dayName + ' is going to be ' + forecast['text'].downcase + 
		' with a low of ' + forecast['low'].to_s + ' and a high of ' + 
		forecast['high'].to_s + '.'

end
end




puts "Enter your location to find out the weather for today!"

user_location = gets.chomp
puts find_locations_weather(user_location)

puts "Do you want to know the forecast for the next five days? 
Please answer Y or N."

user_pref = gets.chomp.upcase

if user_pref == "Y" then
	find_forecast(user_location)
	else
	puts "Thank you have a nice day!"
end


