require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil # stop display sql quiry 
require_all 'lib' # all file in lib folder 



# require('unrest') # remove me
# response = Unirest.get "https://movie-database-imdb-alternative.p.rapidapi.com/?page=1&r=json&s=Avengers+Endgame",
#   headers:{
#     "X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com",
#     "X-RapidAPI-Key" => "64b9d1e264msh179232e5f81caf8p1c6f1djsn0050406ad8fb"
#   }