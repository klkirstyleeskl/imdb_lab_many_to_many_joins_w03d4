DROP TABLE castings;
DROP TABLE stars;
DROP TABLE movies;


CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  budget INT2
);

CREATE TABLE stars (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  fee INT2
);

CREATE TABLE castings (
  id SERIAL4 PRIMARY KEY,
  movie_id INT2 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT2 REFERENCES stars(id) ON DELETE CASCADE
);
