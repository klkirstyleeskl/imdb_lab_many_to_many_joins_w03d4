require('pry')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

movie1 = Movie.new({ 'title' => 'Lord of the Rings', 'genre' => 'Fantasy' })

movie1.save()

binding.pry
nil