require 'yahoo_weatherman'

puts "Please enter your zipcode"

zipcode = gets

def get_location(zipcode)
	client = Weatherman::Client.new
	client.lookup_by_location(zipcode)
end

weather = get_location(zipcode)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

	day = forecast['date']

	weekday = day.strftime('%w').to_i

	if weekday == today
		dayName = 'Today'
	elsif weekday == today + 1
		dayName = 'Tomorrow'
	else
		dayName = day.strftime('%A')
	end

	puts dayName + ' is going to be ' +
	forecast['text'].downcase + ' with a low of ' +
	forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s +
	' degrees Celsius.'
end