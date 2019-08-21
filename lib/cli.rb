class CommandLineInterface
    @@prompt = TTY::Prompt.new

    def greet
        puts 'Welcome to Movie Finder'
    end

    def display 
        puts '
        type a number from this options
        1 Browse All Movies     2 Search     3 Edit     4 Exit'
        
        # display all "movies whit thier actors "
        get_input
    end
    # sepret this method : get_user_input , main
    def get_input
        input = gets.chomp
        case input.to_i
        when 1
            # puts Movie.all_titles
            Movie.browse_all
            display
            get_input
        when 2
            search
        when 3
            edit# edit :  add_movie(), update(), delete() , delete_all() 
        when 4
            goodbye
       
        else
            puts "Error: invalid input"
            get_input
        end

    end

    def get_user_input
        input = gets.chomp
    end
    
    ################# Search #################
    def search
        puts 'Search Options
        1 Search by Title
        2 Search by Actor
        3 Search by genre
        4 Search by director
        5 Search by Character name
        6 Back 
        7 Exit'
        input = get_user_input
        case input.to_i
        when 1
            puts 'Enter movie title'
            find_by_title(get_user_input)
            
            search_agine
        when 2
            puts 'Enter Actor Name'
            find_by_actor(get_user_input)
            
            # result = Role.find_actor_name(get_user_input)
            # puts "Actor name: #{result.actor.name}, Age: #{result.actor.age}, Movie Title: #{result.movie.title}."
            search_agine
        when 3
            puts 'Enter Genre'
            find_by_genre(get_user_input)
            search_agine
           
        when 4
            puts 'Enter Director Name'
            find_by_director(get_user_input)
            search_agine
            # movies includes this actor
        when 5 
            puts "Enter Charactor Name of the actor"    # build me
            find_by_role(get_user_input)
            search_agine
        when 6
            display
            
        when 7
            goodbye
            
        else
            puts "Error: invalid input"
            search_agine
        end

    end

    def find_by_title(movie_title)
        current_movie = Movie.find_movie(movie_title)
        if current_movie    # if exist
            puts "Movie Title #{current_movie.title} , Genre: #{current_movie.genre} , Director: #{current_movie.director}." # puts movie title
            current_movie.movie_actors # puts movie actors from movie_actors class method
        else
            puts "Invalid input"
        end
    end

    
    
    def find_by_actor(actor_name)
        current_actor = Actor.find_actor(actor_name)
        if current_actor
            puts "Actor name #{current_actor.name} , Actor age: #{current_actor.age}." 
            current_actor.actor_movies
        else
            puts "Invalid input"
        end
    end
    
#edit else    
    def find_by_genre(movie_genre)
        current_movies = Movie.find_genre(movie_genre)
        if current_movies
            show_movie_details(current_movies)
        else
            puts "Invalid input"
        end
    end
#edit else 
    def find_by_director(movie_director)
        movies = Movie.where("director LIKE ?", "%"+movie_director+"%")
        movies.each{|movie| puts "Title: #{movie.title}, Directors: #{movie.director} Genre: #{movie.genre}." }
    end

    def find_by_role(role_name)
        current_role= Role.find_role(role_name)
        # binding.pry
        if current_role
            show_role_details(current_role)
        else
            puts "Invalid input"
        end
    end

    
    def search_agine
        puts "Do you want to searsh again? 
                Enter y or n"
        input = gets.chomp
        input == "y" ? search : goodbye
    end


    def goodbye
        puts "Thankyou, goodbye!"
    end

    ################# details #################
    def show_movie_details(movies)
        # take array as argument
        movies.each{|movie| puts "Title: #{movie.title}, Directors: #{movie.director} Genre: #{movie.genre}." }
    end

    def show_role_details(role)
         puts "Actor name: #{role.actor.name} , Role name: #{role.name}.
        Movie title: #{role.movie.title} , Genre: #{role.movie.genre} , Director: #{role.movie.director}."
        
    end

    ################# Edit Movies ################# 
    def edit
        # 1 movie 2 actor 3 role
        puts "select the apropriate number
        1 Add movie
        2 Update movie title
        3 delete movie" 
        input = get_user_input
        case input.to_i
        when 1 
            add_movie
            display
        when 2
            update_movie_title
            display
        when 3
            delete_movie
            display
        when 4
            display
        else
            puts "Error: invalid input"
        end
    end
    
    def add_movie
        puts "Type movie title: "
        new_title = get_user_input
        puts "Type movie genre: "
        new_genre = get_user_input
        puts "Type movie director: "
        new_director = get_user_input
        puts "Actor name: "
        new_actor_name = get_user_input
        puts "Actor age:"
        new_actor_age = get_user_input

        Movie.create(title: new_title, genre: new_genre, director: new_director).actors.create(name:  new_actor_name, age: new_actor_age)
        puts "Movie title: #{Movie.last.title} , Genre: #{Movie.last.genre} , Director: #{Movie.last.director} Actor name: #{Actor.last.name} , Actor age: #{Actor.last.age}.
        ************** Done **************"

    end
    def update_movie_title
        puts "Type old movie title: "
        old_title = get_user_input
        puts "Type a new title: "
        new_title = get_user_input
            
        current_movie = Movie.find_movie(old_title)
        current_movie.update(title: new_title)
        puts "Movie title is updated"
    end
    
    def delete_movie
        puts "Type movie title to delete"
        movie_to_delete = get_user_input
        current_movie = Movie.find_movie(movie_to_delete)
        old_movie = current_movie.title
        current_movie.destroy
        puts "#{old_movie} is deleted "
    end
   



end