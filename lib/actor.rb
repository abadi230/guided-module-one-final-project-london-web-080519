class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles
    
    def actor_movies 
        # all actors belong this movie 
        self.movies.each{|movie| puts "Title: #{movie.title} , Genre: #{movie.genre} , Derector: #{movie.director}."}
    end

    def self.all_names
        self.all.map{|actor| actor.name }
    end


    def self.find_actor(name)
        self.all.find{|actor| actor.name == name}
    end

     #CRUD
    #CREATE
    def self.new_actor(name, age)
        self.create(name: name, age: age)
    end
    # UPDATE
    def self.update_actor(name, new_name, age)
        actor = self.find_by(name: name)
        actor.update(name: new_name, age: age)
    end
    # DELETE 
    def self.delete_actor(name)
        actor = self.find_by(name: name)
        actor.destroy
    end
    # DELETE ALL 
    def self.delete_all_actor
        self.destroy_all
    end
end