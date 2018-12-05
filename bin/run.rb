require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'


welcome
number = get_number_from_user
puts "You entered #{number}"
binding.pry 

petty_fact = web_request(number)

puts petty_fact






