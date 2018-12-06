require_relative('../db/sql_runner')
require_relative('movie')
require_relative('casting')

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars
    (first_name, last_name) VALUES ($1, $2) RETURNING ID"
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values).first
    @id = star['id'].to_i
  end

  def  Star.delete_all
      sql = "DELETE FROM stars"
      SqlRunner.run(sql)
    end

    def movies()
      sql = "SELECT movies.* FROM
            movies INNER JOIN castings ON
            movies.id = castings.movie_id
            WHERE castings.star_id = $1"
      values = [@id]
      movies = SqlRunner.run(sql, values)
      return movies.map {|movie| Movie.new(movie)}
    end

end
