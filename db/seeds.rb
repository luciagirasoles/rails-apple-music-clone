Album.create(title: "Album Nujabes", rating: 3)
Album.create(title: "Album Sinatra", rating: 3)
Album.create(title: "Album Maluma", rating: 3)
Album.create(title: "Album Taylor", rating: 3)

Artist.create(name: "Nujabes", age: "31")
Artist.create(name: "Frank Sinatra", age: "43")
Artist.create(name: "Maluma", age: "28")
Artist.create(name: "Taylor Swift", age: "28")

Song.create(title: "Imaginary Folklore", duration: "3:50", rating: 5, progress: 0)
Song.create(title: "Space dream", duration: "4:50", rating: 5, progress: 0)
Song.create(title: "Shake it off", duration: "3:50", rating: 5, progress: 0)
Song.create(title: "Felices los 4", duration: "3:50", rating: 5, progress: 0)

Association.create(song_id: 1, artist_id: 1, album_id: 1)
Association.create(song_id: 2, artist_id: 2, album_id: 2)
Association.create(song_id: 3, artist_id: 3, album_id: 3)
Association.create(song_id: 4, artist_id: 4, album_id: 4)
