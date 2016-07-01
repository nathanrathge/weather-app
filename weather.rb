require 'barometer'

def celsius_to_f(celtemp)
   ftemp = celtemp.to_i
   ftemp = ftemp*1.8+32
   ftemp = ftemp.to_i
   return ftemp.to_s
end

puts "Where are you?  Tell me where you are and I'll tell you the current temperaure,\nand give you a weaather forecast! Please input ZIP code, airport code, or address."
userlocation = gets

barometer = Barometer.new(userlocation)
weather = barometer.measure

puts "\nCURRENT WEATHER FOR " + userlocation.upcase
puts Time.now
puts "Temperature: " + celsius_to_f(weather.current.temperature) + " F"
puts "Conditions: " + weather.current.condition + "\n\n"

future = weather.forecast

future.each do |future|
   forecastdate = future.starts_at.to_s[0,10]
   dayconvert = Time.parse(forecastdate)
   daynumber = dayconvert.wday
   case daynumber
      when 0
         puts "SUNDAY " + forecastdate
      when 1
         puts "MONDAY " + forecastdate 
      when 2
         puts "TUESDAY " + forecastdate 
      when 3
         puts "WEDNESDAY " + forecastdate 
      when 4
         puts "THURSDAY " + forecastdate 
      when 5
         puts "FRIDAY " + forecastdate 
      when 6
         puts "SATURDAY " + forecastdate 
   end
   puts "   Conditions: " + future.icon + " Temperature: " + celsius_to_f(future.low) + " F to " + celsius_to_f(future.high) + " F.\n\n"
end


