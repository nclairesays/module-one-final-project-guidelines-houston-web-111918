class Login

    def login_menu
        puts "Choose an option:"
        puts "1. Create an Account"
        puts "2. Log in to an Existing Account"
        login_options_input
    end

    def user
        @account_instance
    end

    def login_options_input
        input = gets.chomp
        @account_instance = nil

        if input == "1" || input == "1."
            @account_instance = create_account
            start_trivia
        elsif input == "2" || input == "2."
            @account_instance = login_to_existing_account
            start_trivia
        else
            puts "Yo... Enter number 1 or 2..."
            login_options_input 
        end
    end
     
    def create_account
        created_user = username_input.capitalize
        is_unique = TRUE

        User.all.each do |user|
            if created_user.downcase == user.username.downcase
                is_unique = FALSE
            end
        end
    
        if is_unique == TRUE
            created_user = User.create(username: created_user) #if it is a unique name, then set  the variable to the instance of that name
            created_user.update(age: age_input, gender: gender_input)
        else is_unique == FALSE
            puts "This username already exists."
            puts "Create a unique username or log in to your existing account."
            login_menu
        end
        created_user 
    end

    def username_input
        puts "Ok, let's create your account... Gimme a unique username: "
        gets.chomp
    end

    def age_input
        puts "How old are you?"
        gets.chomp 
    end

    def gender_input
        puts "What is your gender?"
        gets.chomp 
    end

    def login_to_existing_account 
        puts "Enter your login information: "
        gets.chomp
    end

    def start_trivia
        puts "Hi, #{user}. "
        #it works for user if i enter an existing user. needs user.name if new user
        puts "We are now ready to learn some PETTY facts about numbers!"
        enter_number
    end

    def enter_number
        t = NumbersTrivia.new
        binding.pry
        t.gets_num_and_show_fact
        # bookmark_menu
    end

    def bookmark_menu
        puts "Would you like to save this interesting but petty fact in your bookmarks?"
        bookmark_menu_input
    end

    def bookmark_menu_input
        input = gets.chomp
        if input.downcase == "yes"
            save_bookmark
        else 
           other_options 
        end
    end

    def other_options
        puts "Okay...Would you like to... \n1) See the another fact about that same number?(doesn't work yet) \n2) Enter a new number?"
        other_options_input
    end

    def other_options_input
        input = gets.chomp
        if input == "1" || input == "1." || input == "1)"
            #puts ""
        elsif input == "2" || input == "2." || input == "2)"
            enter_number
        else
            puts "That wasn't an option!"
            other_options_input
        end
    end

    # def save_bookmark
    #     binding.pry
    # end

end