artist1 = Artist.create(name: "Nujabes", age: "31")
artist2 = Artist.create(name: "Frank Sinatra", age: "43")
artist3 = Artist.create(name: "Maluma", age: "28")
artist4 = Artist.create(name: "Taylor Swift", age: "28")

song1 = Song.create(title: "Imaginary Folklore", duration: "3:50", rating: 5, progress: 0)
song2 = Song.create(title: "Space dream", duration: "4:50", rating: 5, progress: 0)
song3 = Song.create(title: "Shake it off", duration: "3:50", rating: 5, progress: 0)
song4 = Song.create(title: "Felices los 4", duration: "3:50", rating: 5, progress: 0)

album = Album.create(title: "Album Nujabes", rating: 3)
album.songs << song1
album.artists << artist1

album2 = Album.create(title: "Album Sinatra", rating: 3)
album2.songs << song2r
album2.artists << artist2

album3 = Album.create(title: "Album Maluma", rating: 3)
album3.songs << song3
album3.artists << artist3

album4 = Album.create(title: "Album Taylor", rating: 3)
album4.songs << song4
album4.artists << artist4

User.create(email: "diegotc86+1@gmail.com", password: "123456")
User.create(email: "iamdeyvi+1@gmail.com", password: "123456")
User.create(email: "cayala.w+1@gmail.com", password: "123456")
User.create(email: "cesarcachay1996+1@gmail.com", password: "123456", role: "admin")
User.create(email: "christoph.roa+1@gmail.com", password: "123456")