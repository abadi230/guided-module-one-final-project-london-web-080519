class CreateMovies < ActiveRecord::Migration[5.2]
    create_table :movies do |t|
        t.string :plot
        t.string :title
        t.string :auther

    end
end