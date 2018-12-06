class Welcome
    
    def welcome_menu
        puts "Welcome! \nReady to learn some petty facts about numbers? \nEnter yes or no:"
        welcome_options_input
    end

    def welcome_options_input
        input = gets.chomp.downcase 
        if input == "yes"
            Login.new.login_menu
        elsif input == "no"
            puts "Ok, goodbye then... AND NEVER COME BACK!!!! \n(just kidding. please come back and use our app.)"
            exit
        else 
            puts "Can you read?!?!? I said to enter yes or no!!!"
            welcome_options_input
        end
    end

end

