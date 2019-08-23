class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles
    
    def actor_movies 
        # all actors belong to this movie 
        self.movies.map {|movie| "Movie Title: #{movie.title}"}
           
    end

    def self.find_actor(name)
        # self.all.find{|actor| actor.name.downcase.include?(name.downcase)}
        self.all.select{|actor| actor.name.downcase.include?(name.downcase)}
    end

end