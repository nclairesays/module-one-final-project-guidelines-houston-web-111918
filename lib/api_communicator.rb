#require 'rest-client'
require 'pry'

def welcome
    puts "Welcome!"
end

def get_number_from_user
    puts "Please enter a number"
    number = gets.chomp
end

def web_request(number)
    RestClient.post("http://numbersapi.com/#{number}")
binding.pry 
end