p "Starting db seeding"

User.create(email: "diegotc86+1@gmail.com", password: "123456")
User.create(email: "iamdeyvi+1@gmail.com", password: "123456")
User.create(email: "cayala.w+1@gmail.com", password: "123456")
User.create(email: "cesarcachay1996+1@gmail.com", password: "123456", role: "admin")
User.create(email: "christoph.roa+1@gmail.com", password: "123456")

artist1 = Artist.create(name: "Nujabes", age: "31", user_id: 1)
artist2 = Artist.create(name: "Frank Sinatra", age: "43", user_id: 1)
artist3 = Artist.create(name: "Maluma", age: "28", user_id: 2)
artist4 = Artist.create(name: "Taylor Swift", age: "28", user_id: 3)

song1 = Song.create(title: "Imaginary Folklore", duration: "3:50", rating: 0, progress: 0, user_id: 1)
song2 = Song.create(title: "Space dream", duration: "4:50", rating: 0, progress: 0, user_id: 1)
song3 = Song.create(title: "Shake it off", duration: "3:50", rating: 0, progress: 0, user_id: 2)
song4 = Song.create(title: "Felices los 4", duration: "3:50", rating: 0, progress: 0, user_id: 3)

album1 = Album.create(title: "Album Nujabes", rating: 0, user_id: 1)
album1.songs << song1
album1.artists << artist1

album2 = Album.create(title: "Album Sinatra", rating: 0, user_id: 1)
album2.songs << song2
album2.artists << artist2

album3 = Album.create(title: "Album Maluma", rating: 0, user_id: 2)
album3.songs << song3
album3.artists << artist3

album4 = Album.create(title: "Album Taylor", rating: 0, user_id: 3)
album4.songs << song4
album4.artists << artist4

p "starting Rating populating" 
song1.ratings.create(user_id: 1, value: 1)
song1.ratings.create(user_id: 2, value: -1)
song1.ratings.create(user_id: 3, value: -1)
song2.ratings.create(user_id: 2, value: 1)
song2.ratings.create(user_id: 1, value: -1)
song2.ratings.create(user_id: 5, value: 1)
song2.ratings.create(user_id: 3, value: 1)
song3.ratings.create(user_id: 2, value: -1)
song3.ratings.create(user_id: 3, value: 1)
song3.ratings.create(user_id: 1, value: 1)
song3.ratings.create(user_id: 4, value: 1)
song4.ratings.create(user_id: 5, value: 1)
song4.ratings.create(user_id: 4, value: 1)
song4.ratings.create(user_id: 3, value: 1)
song4.ratings.create(user_id: 2, value: 1)
song4.ratings.create(user_id: 1, value: 1)
album1.ratings.create(user_id: 1, value: 1)
album1.ratings.create(user_id: 2, value: -1)
album1.ratings.create(user_id: 4, value: -1)
album1.ratings.create(user_id: 5, value: 1)
album2.ratings.create(user_id: 1, value: 1)
album2.ratings.create(user_id: 3, value: -1)
album2.ratings.create(user_id: 2, value: -1)
album2.ratings.create(user_id: 4, value: -1)
album2.ratings.create(user_id: 5, value: 1)
album3.ratings.create(user_id: 2, value: -1)
album3.ratings.create(user_id: 1, value: 1)
album3.ratings.create(user_id: 3, value: -1)
album3.ratings.create(user_id: 4, value: 1)
album3.ratings.create(user_id: 5, value: -1)
album4.ratings.create(user_id: 4, value: 1)
album4.ratings.create(user_id: 5, value: -1)

p "Ending Rating populating"

p "Ending DB seeding"
