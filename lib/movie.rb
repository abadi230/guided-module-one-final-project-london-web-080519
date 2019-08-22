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
    #specific query 

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
     
end