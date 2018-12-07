class NumbersTrivia
    def gets_num_and_show_fact
        number = get_number_from_user
        fact = web_request(number)

        system("clear")
        puts "************************\n\n#{fact}\n\n************************\n\n\n"

        #need to create conditional method. if can't find number in data base, then create a new num instance FIX THIS
        $num_instance = Number.find_by(int_num: number)
        $fact_instance = PettyFact.create(petty_fact: fact, number: $num_instance)
    end
        
    def get_number_from_user
        puts "************************\n\n"
        puts "What number would you like to learn about? Enter an integer.\n\n"
        gets.chomp
        #need code for if user doesn't not enter a number FIX THIS
    end
    
    def web_request(number)
        RestClient.get("http://numbersapi.com/#{number}").body
    end
end








