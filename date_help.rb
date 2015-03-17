#want to return 'Today' and "tomorrow" 
 #and then each day of the week
  
 # puts forecasts['day'].strftime('%w') 
 # => doesn't work
 
 # days = forecasts['day']
 # puts days.strftime('%w') doesn't work
 
 #new idea: use array notation to access each array
 # to then determine whether it is today or tomorrow
 # for example: if the index = 0, then it is today
 # and if the index = 1, then it is tomorrow
 # else then use the day 
 # but have to make the actual day say 'today'
 # How to do that?
 
 # How to take the day from the loop and assign it 
 # the strftime integer?
 
 #Maybe first try just accessing the first array and 
 # turning that day into a strftime integer?
 #Play around with that and then try to take on the
 # whole loop. 
 #I'm trying to take a value within an array which is a 
 # hash. Then I'm trying to take a value from that hash
 # and assign it a integer from strftime. Strftime can't 
 # tell that the day String forecast returns is an actual
 # day. So how to tell strftime that the day is an 
 # an actual day? 
 #Maybe do a sort of equal thing? Like
 # if the string that forecast returns is equal to 
 # a day that strftime recognizes then assign it a
 # particular integer?
 # 
 
require 'yahoo_weatherman'

require 'date'


def get_location(location)
client = Weatherman::Client.new
client.lookup_by_location(location)
end
 
weather = get_location('93003')

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date'] 

weekday = day.strftime('%w').to_i

if weekday == today
	dayName = 'Today'
elsif weekday == today + 1
	dayName = "Tomorrow"
else	dayName = day.strftime('%A')
end 

puts dayName 

end

#if forecast_array

