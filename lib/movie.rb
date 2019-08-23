class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles
    
    def self.movie_details(movie)
        current_movie = []
        if movie.kind_of?(Array)
            self.all.each do |movie|
                current_movie << "Title: #{movie.title}, Director: #{movie.director}, Genre: #{movie.genre}." 
            end
        else
            current_movie << "Title: #{movie.title}, Directors: #{movie.director}, Genre: #{movie.genre}." 
        end

        current_movie
    end

    def movie_actors 
        # all actors belong to this movie 
        actors_name = []
        # self.actors.map{|actor| actors_name << "Actor name: #{actor.name}"}
        self.actors.map{|actor| actors_name << actor.name}
        actors_name
    end
    
    def movie_roles
        # all roles belong to this movie
        self.roles.map{|role| role.name}

    end
    #specific query or process like map, each ..etc


    def self.find_movie(title)
        self.all.find{|movie| movie.title.downcase.include?(title.downcase)}
    end

    def self.find_genre(genre)
        # converts movie.genre and input to downcase. return the matches 
        self.all.select{|movie| movie.genre.downcase.include?(genre.downcase)}
        # current_movie =[]
        # self.all.select{|movie| current_movie << movie.genre.downcase.include?(genre.downcase)}
        # current_movie
    end

    def self.fine_director(director)
        self.all.find{|movie| movie.director.downcase.include?(director.downcase)}
    end

    def self.most_actors
        # movie has the largest number of actors 
        Movie.all.max_by{|movie| movie.actors.count}
    end
    
    def self.all_information
        all_info = []   # create a new array  
        Movie.all.each do |movie|
            # iterate movies, and push title, genre, director to that arrya
            all_info << "Movie title: #{movie.title}"
            all_info << "Genre: #{movie.genre}"
            all_info << "Director: #{movie.director}"
            all_info << "Actors: #{movie.movie_actors}"
            all_info << "Roles: #{movie.movie_roles}"
            all_info << "-----------------------------------"
        end
        # retur array contains all information
        all_info
    end

end