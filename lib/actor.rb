class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles
    
    def actor_movies 
        # all actors belong to this movie 
        self.movies.each{|movie| puts "Movie Title: #{movie.title} , Genre: #{movie.genre} , Derector: #{movie.director}."}
    end

    def self.all_names
        self.all.map{|actor| actor.name }
    end


    def self.find_actor(name)
        self.all.find{|actor| actor.name.downcase.include?(name.downcase)}
    end

    
end