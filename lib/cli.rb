class CLI 
    def welcome
        puts "welcome!"
    end

    # def get_num_and_show_fact
    #     number = get_number_from_user
    #     puts = web_request(number)
    # end


    def get_number_from_user
        puts "Please enter a number"
        gets.chomp
    end
    
    def web_request(number)
        RestClient.get("http://numbersapi.com/#{number}").body
    end
end
