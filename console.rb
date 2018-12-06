require('pry')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

Movie.delete_all
Star.delete_all
Casting.delete_all


movie1 = Movie.new({ 'title' => 'Lord of the Rings', 'genre' => 'Fantasy', 'budget' => '500' })
movie2 = Movie.new({ 'title' => 'Armageddon', 'genre' => 'Sci-Fi', 'budget' => '200' })

movie1.save()
movie2.save()

star1 = Star.new({'first_name' => 'Ian', 'last_name' => 'McKellan', 'fee' => '50' })
star2 = Star.new({'first_name' => 'Liv', 'last_name' => 'Tyler', 'fee' => '10' })
star1.save
star2.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id})
casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id})
casting3 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id})

casting1.save
casting2.save
casting3.save

movie1.fees

binding.pry
nil
