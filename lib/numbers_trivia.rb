class NumbersTrivia
    def gets_num_and_show_fact
        number = get_number_from_user

        
        binding.pry
        # Number.new(int_num: number)
        fact = web_request(number)
        # PettyFact.new(petty_fact: fact, )
        puts "\n*** #{fact} ***\n\n"
    end
        
    def get_number_from_user
        print "What number would you like to learn about? "
        gets.chomp
        # Number.new(int_num: num)
    end
    
    def web_request(number)
        RestClient.get("http://numbersapi.com/#{number}").body
    end
end

t = NumbersTrivia.new
# t.gets_num_and_show_fact







