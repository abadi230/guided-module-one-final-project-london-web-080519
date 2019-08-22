class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles
    
    def movie_actors 
        # all actors belong to this movie 
        # self.actors.each{|actor| puts "Actor name: #{actor.name} , Actor age: #{actor.age}."}
        self.actors.map{|actor| actor.name}
    end
    
    def movie_roles
        # all roles belong to this movie
        self.roles.map{|role| role.name}
    end
    #specific query or process like map, each ..etc

    def self.all_titles
        self.all.map{|movie| movie.title }
    end

    def self.find_movie(title)
        self.all.find{|movie| movie.title.downcase.include?(title.downcase)}
    end

    def self.find_genre(genre)
        # converts movie.genre and input to downcase. return the matches 
        self.all.select{|movie| movie.genre.downcase.include?(genre.downcase)}
    end

    def self.fine_director(director)
        self.all.find{|movie| movie.director.downcase.include?(director.downcase)}
    end

    def self.most_actors
        Movie.all.max_by{|movie| movie.actors.count}
    end
    
    # def self.movies_with_actors_roles
    #     Movie.all.each do |movie|
    #         puts "Title: #{movie.title} , Genre: #{movie.genre} , Director: #{movie.director}."
    #         # then print the actors for each movie 
    #         puts "Actors:"
    #         puts movie.movie_actors
    #         puts "Roles:"
    #         puts movie.movie_roles
    #         puts "---------------------"
    #     end
    # end
# # improve movies_with_actors_roles "don't use puts in modle" 
    # def movies_with_actors_roles
    #      "Title: #{self.title} , Genre: #{self.genre}, Director: #{self.director}.\nActors:\n#{self.movie_actors}\nRoles:\n#{self.movie_roles}\n---------------------\n"
    #      #array store all information 
    #     #  then just call it from cli
    # end
# improve movies_with_actors_roles: we don't have to use process in cli (Movie.all). so now all information in array ready to be called 
    def self.all_information
        all_info = []
        Movie.all.each do |movie|
            all_info << "Movie title: #{movie.title}"
            all_info << "Genre: #{movie.genre}"
            all_info << "Director: #{movie.director}"
            all_info << "Actors: #{movie.movie_actors}"
            all_info << "Roles: #{movie.movie_roles}"
            all_info << "-----------------------------------"
            # binding.pry
        end
        all_info
    end

end