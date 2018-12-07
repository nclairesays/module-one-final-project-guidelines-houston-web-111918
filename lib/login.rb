class Login

    def login_menu
        puts "************************\n\n"
        puts "Great! Choose an option:\n\n"
        puts "1. Create an Account"
        puts "2. Log in to an Existing Account\n\n"
        #puts "At any time, enter 'Exit' if you want to leave the program"
        login_options_input
    end

    def login_options_input
        input = gets.chomp.downcase
        system("clear")
        $account_instance = nil

        if input == "1" || input == "1."
            $account_instance = create_account
            start_trivia
        elsif input == "2" || input == "2."
            $account_instance = login_to_existing_account
            start_trivia
        elsif input == "exit" || input == "exit!"
            system("clear")
            puts "'Exit' wasn't listed as option, but fine...BYE!"
            exit
        else
            puts "Yo... Enter number 1 or 2..."
            login_options_input 
        end
    end
     
    def create_account
        created_user = username_input
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
            puts "\n"
            puts "************************\n\n"
            puts "This username already exists!"
            puts "Create a unique username or log in to your existing account.\n\n"
            login_menu
        end
        created_user 
    end

    def username_input
        system("clear")
        puts "************************\n\n"
        puts "Ok, let's create your account... Gimme a unique username: \n\n"
        gets.chomp.capitalize
    end

    def age_input
        system("clear")
        puts "************************\n\n"
        puts "How old are you?\n\n"
        gets.chomp 
    end

    def gender_input
        system("clear")
        puts "************************\n\n"
        puts "What is your gender?\n\n"
        gets.chomp.downcase
    end

    def login_to_existing_account 
        puts "************************\n\n"
        puts "Enter your login information:\n\n"
        input = gets.chomp.capitalize
        User.all.find_by(username: input)
    end

    def start_trivia
        system("clear")
        puts "************************\n\n"
        puts "Greetings, #{$account_instance.username}!"
        puts "We are now ready to learn some PETTY facts about numbers!\n\n"
        trivia_or_bookmarks?
    end

    def trivia_or_bookmarks?
        puts "************************\n\n"
        puts "Would you like to:\n\n1. View a NEW petty fact?"
        puts "2. View your bookmarks?"
        puts "3. Exit program\n\n"
        #puts "4. View top 5 PETTY FACTS voted on by your petty peers\n\n"
        input = gets.chomp.downcase
        if input == "1" || input == "1."
            system ("clear")
            enter_number
        elsif input == "2" || input == "2."
            system ("clear")
            puts "************************\n\n"
            puts "Apparently, you think these PETTY facts are interesting enough to save: \n\n"
            view_all_bookmarks
            puts ""
            trivia_or_bookmarks?
        elsif input == "3" || input == "3." || input == "exit" || input == "exit!"
            system("clear")
            puts "************************\n\n"
            puts "Thank you! Come again!\n\n"
            puts "************************\n\n"
            exit
        #elsif
            #input == "4" || input == "4."
            #most_popular_facts
        else
            puts "Yo... Read the instructions!"
            trivia_or_bookmarks?
        end
    end

    def enter_number
        t = NumbersTrivia.new
        t.gets_num_and_show_fact
        bookmark_menu
    end

    def bookmark_menu
        puts "Would you like to save this interesting but PETTY fact in your bookmarks?\n\n"
        bookmark_menu_input
    end

    def bookmark_menu_input
        input = gets.chomp
        system("clear")
        if input.downcase == "yes"
            Bookmark.create(user: $account_instance, petty_fact: $fact_instance)
            puts "************************\n\n"
            puts "You have successfully saved that PETTY fact!\n\n"
            trivia_or_bookmarks?
        elsif input.downcase == "no"
           other_options 

        elsif input.downcase == "exit" || input.downcase == "exit!"
            exit
        else
            puts "************************\n\n"
            puts "That wasn't an option...'Yes' or 'No', please!\n\n"
            bookmark_menu  
        end
    end


    def view_all_bookmarks
        validate_existing_user
        all_bookmarks = Bookmark.all.find_by(user: $account_instance)
        facts = all_bookmarks.user.petty_facts
        list_of_facts = facts.map do |fact|
            "\u2022 #{fact.petty_fact}"
        end
        puts list_of_facts
    end

    def validate_existing_user
        created_user = $account_instance
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
            puts "\n"
            puts "************************\n\n"
            puts "This username already exists!"
            puts "Create a unique username or log in to your existing account.\n\n"
            login_menu
        end
    end

    def other_options
        system("clear")
        puts "************************\n\n"
        puts "Okay...Would you like to...\n\n1. See the another fact about that same number?(doesn't work yet) \n2. Enter a new number?"
        other_options_input
    end

    def other_options_input
        input = gets.chomp
        system("clear")
        if input == "1" || input == "1."
            #puts "" FIX THIS
        elsif input == "2" || input == "2."
            enter_number
        elsif input.downcase == "exit" || "exit!"
            exit
        else
            puts "************************\n\n"
            puts "That wasn't an option!\n\n"
            puts "Would you like to..."
            puts "1. See another fact about that same number?(doesn't work yet)"
            puts "2. Enter a new number?"
            other_options_input
        end
    end


    # def most_popular_facts
    #     PettyFact.group(:user_id).order('petty_fact_id DESC').limit(5).count(:id)
    #     binding.pry
    # end

    # def top_facts_of_the_week
    #     Bookmark.all.each do |book|
    #     book.order("date_truc('week', published_at)")
    #     end
    # end


    




         




        

end