class Role < ActiveRecord::Base
    belongs_to :actor # actor 
    belongs_to :movie 

    
    def self.all_roles
        self.all.map{|role| role.name }
    end

    def self.find_role(name)
        # self.all.find{|role| role.name.downcase.include?(name.downcase)}
        # self.all.find{|role| role.name == name}
        self.all.find{|role| role.name.downcase.include?(name.downcase)}
    end

    def role_actor
        self.actor.name
    end

    def role_movie
        self.movie.title
    end

end