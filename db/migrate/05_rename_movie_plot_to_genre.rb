class RenameMoviePlotToGenre < ActiveRecord::Migration[5.2]
    def change
        rename_column :movies, :plot, :genre
        rename_column :movies, :auther, :director
    end
end