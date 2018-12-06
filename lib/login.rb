class Login

    def login_menu
        puts "Choose an option:"
        puts "1. Create an Account"
        puts "2. Log in to an Existing Account"
        login_options_input
    end

    # def user
    #     $account_instance
    # end

    def login_options_input
        input = gets.chomp
        system("clear")
        $account_instance = nil

        if input == "1" || input == "1."
            $account_instance = create_account
            start_trivia
        elsif input == "2" || input == "2."
            $account_instance = login_to_existing_account
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
            if created_user == user.username
                is_unique = FALSE
            end
        end
    
        if is_unique == TRUE
            created_user = User.create(username: created_user) #if it is a unique name, then set  the variable to the instance of that name
            created_user.update(age: age_input, gender: gender_input)
        else is_unique == FALSE
            puts "\n\nThis username already exists."
            puts "Create a unique username or log in to your existing account."
            login_menu
        end
        created_user 
    end

    def username_input
        system("clear")
        puts "Ok, let's create your account... Gimme a unique username: "
        gets.chomp
    end

    def age_input
        system("clear")
        puts "How old are you?"
        gets.chomp 
    end

    def gender_input
        system("clear")
        puts "What is your gender?"
        gets.chomp 
    end

    def login_to_existing_account 
        puts "Enter your login information: "
        input = gets.chomp
        User.all.find_by(username: input)
    end

    def start_trivia
        system("clear")
        puts "Hi, #{$account_instance.username}. \n\n"
        puts "We are now ready to learn some PETTY facts about numbers!\n\n"
        trivia_or_bookmarks?
    end

    def trivia_or_bookmarks?
        puts "Would you like to \n1. View a new PETTY fact?"
        puts "2. View your bookmarks?"
        input = gets.chomp
        if input == "1" || input == "1."
            enter_number
        elsif input == "2" || input == "2."
           puts "This doesn't work yet."
        else
            puts "Yo... Enter number 1 or 2..."
            trivia_or_bookmarks?
        end
    end

    def enter_number
        t = NumbersTrivia.new
        t.gets_num_and_show_fact
        bookmark_menu
    end

    def bookmark_menu
        puts "Would you like to save this interesting but PETTY fact in your bookmarks?"
        bookmark_menu_input
    end

    def bookmark_menu_input
        input = gets.chomp
        system("clear")
        if input.downcase == "yes"
            Bookmark.create(user: $account_instance, petty_fact: $fact_instance)
            puts "You have successfully saved that PETTY fact!"

        else 
           other_options 
        end
    end


    def bookmark_menu_2


    end

    def other_options
        system("clear")
        puts "Okay...Would you like to... \n1. See the another fact about that same number?(doesn't work yet) \n2. Enter a new number?"
        other_options_input
    end

    def other_options_input
        input = gets.chomp
        system("clear")
        if input == "1" || input == "1."
            #puts ""
        elsif input == "2" || input == "2."
            enter_number
        else
            puts "That wasn't an option!"
            other_options_input
        end
    end

    # def save_bookmark

    #     # binding.pry


    # end

end