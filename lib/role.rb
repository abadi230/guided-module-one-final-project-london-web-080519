class Role < ActiveRecord::Base
    belongs_to :actor # actor 
    belongs_to :movie 

    
    def self.all_roles
        self.all.map{|role| role.name }
    end

    def self.find_role(name)
        self.all.find{|role| role.name == name}
    end

    def self.most_roles
        # Actor.all.where()
        
    end
# chose approprite name
    
        
    # end

     #CRUD
    # #CREATE
    # def self.new_role(role_name, movie_id, actor_id)
    #     self.create(name: role_name, movie_id: movie_id, actor_id: actor_id)
    # end
    # # UPDATE
    # def self.update_movie(name, new_role, movie_id, actor_id)
    #     role = self.find_by(name: name)
    #     role.update(name: new_role, movie_id: movie_id, actor_id: actor_id)
    # end
    # # DELETE 
    # def self.delete_movie(name)
    #     role = self.find_by(name: name)
    #     role.destroy
    # end
    # # DELETE ALL 
    # def self.delete_all_movies
    #     self.destroy_all
    # end
   

end