class CreateActors < ActiveRecord::Migration[5.2]
    create_table :actors do |t|
        t.string :name
        t.integer :age
        
    end
end