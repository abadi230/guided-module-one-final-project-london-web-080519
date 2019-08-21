class CreateRoles < ActiveRecord::Migration[5.2]
    create_table :roles do |t|
        t.integer :actor_id 
        t.integer :movie_id

    end
end