require_relative("../db/sql_runner")
require_relative("casting")
require_relative("star")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies
      (
      title,
      genre,
      budget
      )
      VALUES
      (
        $1, $2, $3
        )
        RETURNING id"
        values = [@title, @genre, @budget]
        movie = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
  end

  def Movie.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def stars()
    sql =  "SELECT stars.* FROM
    stars INNER JOIN castings ON
    stars.id = castings.star_id
    WHERE castings.movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map{ |star| Star.new(star)}
  end

  def fees()
    sql = "SELECT SUM(fee) FROM
    stars INNER JOIN castings ON
    stars.id = castings.star_id
    WHERE castings.movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    total_fees = result['sum'].to_i
    remaining_budget = @budget - total_fees
    return remaining_budget
  end

end
