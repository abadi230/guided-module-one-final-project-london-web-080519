Actor.destroy_all
Movie.destroy_all
Role.destroy_all


actor_1 = Actor.create(name: "Deepika Padukone", age: 30)
actor_2 = Actor.create(name: "Arjun Rampal", age: 27)
actor_3 = Actor.create(name: "Kareena Kapoor", age: 40)
actor_4 = Actor.create(name: "Brad Pitt", age: 29)
actor_5 = Actor.create(name: "Leonardo DiCaprio", age: 33) #25
actor_6 = Actor.create(name: "Brie Larson", age: 26)
actor_7 = Actor.create(name: "Samuel L. Jackson", age: 34)
actor_8 = Actor.create(name: "Yalitza Aparicio", age: 41)
actor_9 = Actor.create(name: "Marina de Tavira", age: 30)
actor_10 = Actor.create(name: "Diego Cortina Autrey", age: 36)


movie_1 = Movie.create(title: "From Russia With Love (1963)", plot: "Action", auther: "d. Terence Young")
movie_2 = Movie.create(title: "Karthik Calling Karthik", plot: "thriller ", auther: "Vijay Lalwani")#25
movie_3 = Movie.create(title: "Rock On!!", plot: "Drama", auther: "Abhishek Kapoor")
movie_4 = Movie.create(title: "Once Upon a Time ... in Hollywood", 
plot: "Crime, Drama", auther: "Quentin Tarantino")
movie_5 = Movie.create(title: "Captain Marvel", 
plot: "Action, Fantasy", auther: "AAnna Boden, Ryan Fleck")
movie_6 = Movie.create(title: "Roma", plot: "Drama", auther: "Alfonso Cuarón")



role_1 = Role.create(movie_id: movie_1.id, actor_id: actor_1.id)

role_2 = Role.create(movie_id: movie_2.id, actor_id: actor_2.id)
role_3 = Role.create(movie_id: movie_3.id, actor_id: actor_3.id)
role_4 = Role.create(movie_id: movie_4.id, actor_id: actor_4.id)
role_5 = Role.create(movie_id: movie_4.id, actor_id: actor_5.id)
role_6 = Role.create(movie_id: movie_5.id, actor_id: actor_6.id)
role_7 = Role.create(movie_id: movie_5.id, actor_id: actor_7.id)
role_8 = Role.create(movie_id: movie_6.id, actor_id: actor_8.id)
role_9 = Role.create(movie_id: movie_6.id, actor_id: actor_9.id)
role_10 = Role.create(movie_id: movie_6.id, actor_id: actor_10.id)

