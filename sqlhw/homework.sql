-- Question 1
SELECT id, title, genres
FROM movielens.movies;

-- Question 2
SELECT id, title
FROM movielens.movies
LIMIT 10;

-- Question 3
SELECT id, title
FROM movielens.movies
WHERE id = 485;

-- Question 4
SELECT id
FROM movielens.movies
WHERE title LIKE '%Made in America%';

-- Question 5
SELECT title
FROM movielens.movies
ORDER BY IF(title RLIKE '^[a-z]', 1, 2), title
LIMIT 10;

SELECT title
FROM movielens.movies
ORDER BY title ASC
LIMIT 10;

-- Question 6
SELECT title
FROM movielens.movies
WHERE title LIKE '%2002%';

-- Question 7
SELECT title
FROM movielens.movies
WHERE title LIKE '%Godfather, The%';

-- Question 8
SELECT title
FROM movielens.movies
WHERE genres LIKE '%Comedy%';

-- Question 9
SELECT title
FROM movielens.movies
WHERE genres LIKE '%Comedy%' &&
title LIKE '%(2000)%';

-- Question 10
SELECT title
FROM movielens.movies
WHERE genres LIKE '%Comedy%' &&
genres LIKE '%Horror%';

-- Question 11
SELECT title
FROM movielens.movies
WHERE title LIKE '%(2001)%'
&& title LIKE '%Super%' OR
title LIKE '%(2002)%'
&& title LIKE '%Super%';

-- Question 12 
Created Stuff;

-- Question 13
INSERT INTO movielens.actors (name, char_name, birth, movie_id)
VALUES 
('Guy Fieri', 'Iron Man', '2000-01-01', 1),
('Morgan Freeman', 'Black Panther', '2001-01-01', 1),
('Brad Pitt', 'A Big Cat', '2002-01-01', 1),
('Michael Sera', 'An awkward guy', '2003-01-01', 1),
('Halle Berry', 'That one lady', '2004-01-01', 1),
('Emma Stone', 'President', '2005-01-01', 1),
('Daniel Ratcliffe', 'Harry', '2006-01-01', 1),
('Tom Hanks', 'Woody', '2007-01-01', 1),
('The Rock', 'The Rock', '2008-01-01', 1),
('Samuel L. Jackon', 'Nick Fury', '2009-01-01', 1),
('Will Smith', 'Obama', '1921-01-01', 100),
('Robert Downy Jr.', 'Sherlock Holmes', '1922-01-01', 100),
('Chris Pratt', 'George W. Bush', '1923-01-01', 100),
('Steve Carell', 'Max', '1924-01-01', 100),
('Rami Malik', 'Freddie Mercury', '1925-01-01', 100),
('Heathe Ledger', 'Joker', '1926-01-01', 100),
('Edward Norton', 'The Hulk', '1927-01-01', 100),
('Chris Evans', 'Captain America', '1928-01-01', 100),
('Chris Hemsworth', 'Thor', '1929-01-01', 100),
('Mark Ruffalo', 'Hulk', '1920-01-01', 100),
('Will Ferrel', 'Neo', '1913-01-01', 500),
('James Franco', 'High guy', '1912-01-01', 500),
('Johnny Depp', 'Pirate', '1914-01-01', 500),
('Al Pacino', 'Mob', '1972-01-01', 500),
('Tom Cruise', 'Mission guy', '1952-01-01', 500),
('Matt Damon', 'Will', '1972-01-01', 500),
('Harrison Ford', 'Indiana Jones', '1917-01-01', 500),
('Denzel Washington', 'Ralph', '1982-01-01', 500),
('Toby Maguire', 'Spider Man', '1992-01-01', 500),
('Michael B. Jordan', 'Creed Jr.', '1962-01-01', 500);

-- Question 14
UPDATE movielens.movies
SET rating = 'G'
WHERE id = 1;

UPDATE movielens.movies
SET rating = 'PG'
WHERE id = 2;

UPDATE movielens.movies
SET rating = 'PG-13'
WHERE id = 3;

UPDATE movielens.movies
SET rating = 'R'
WHERE id = 4;

UPDATE movielens.movies
SET rating = 'PG'
WHERE id = 5

-- Question 15
SELECT movies.title, ratings.rating
FROM movielens.movies 
INNER JOIN movielens.ratings 
ON movielens.movies.id = movielens.ratings.movie_id
WHERE title LIKE '%Godfather, The%'

-- Question 16
SELECT movies.title, ratings.rating, ratings.timestamp
FROM movielens.movies 
INNER JOIN movielens.ratings 
ON movielens.movies.id = movielens.ratings.movie_id
WHERE title LIKE '%Godfather, The%'
ORDER BY timestamp ASC

-- Question 17
SELECT title, imdb_Id
FROM movielens.movies 
INNER JOIN movielens.links 
ON movielens.movies.id = movielens.links.imdb_Id
WHERE title LIKE '%(2005)%' && genres LIKE '%Comedy%'

-- Question 18
SELECT title
FROM movielens.movies
WHERE id NOT IN (SELECT movie_id FROM movielens.ratings);

-- Question 19
SELECT AVG(rating) 
FROM movielens.ratings
WHERE movielens.ratings.movie_id = 858

-- Question 20
SELECT COUNT(rating) 
FROM movielens.ratings
WHERE movielens.ratings.movie_id = 858

-- Question 21
SELECT COUNT(genres) 
FROM movielens.movies
WHERE genres LIKE '%Comedy%'

-- Question 22
SELECT AVG(rating) 
FROM movielens.ratings 
WHERE user_id = 1

-- Question 23
SELECT COUNT(rating) u, user_id
FROM movielens.ratings
GROUP BY user_id
ORDER BY u DESC
LIMIT 1;

-- Question 24
SELECT AVG(rating) u, user_id
FROM movielens.ratings
GROUP BY user_id
ORDER BY u DESC
LIMIT 1;

-- Question 25
SELECT AVG(rating) a, user_id, COUNT(rating) r
FROM movielens.ratings
GROUP BY user_id
HAVING r > 50
ORDER BY a DESC
LIMIT 1;

-- Question 26
SELECT AVG(rating) a, title
FROM movielens.ratings
INNER JOIN movielens.movies
ON movielens.movies.id = movielens.ratings.movie_id
GROUP BY title
HAVING a > 4
ORDER BY a DESC;

-- HARD MODE
-- Question 27
SELECT CONCAT('https://www.imdb.com/title/tt', imdb_Id)
FROM movielens.links ;

-- Question 28
SELECT CONCAT('https://www.themoviedb.org/movie/', tmdb_Id)
FROM movielens.links ;

-- Question 29
TV SHOW;

-- Question 30
SELECT REPLACE(LOWER(tag), ' ', '-')
FROM movielens.tags ;

-- Question 31
UPDATE movielens.movies
SET movie_year = SUBSTR(title, -6, 6)
WHERE movie_year IS NULL

-- Question 32
UPDATE movielens.movies
SET title = (SELECT REPLACE(title, SUBSTRING(title, -6, 6), ''))
WHERE movies.id = movies.id

-- Question 33 Couldn't get this one to work
SELECT AVG(rating) a
FROM movielens.ratings
INNER JOIN movielens.movies
ON movielens.movies.id = movielens.ratings.movie_id
GROUP BY title

UPDATE movielens.movies
SET movie_rating = (SELECT AVG(rating) a
FROM movielens.ratings
INNER JOIN movielens.movies
ON movielens.movies.id = movielens.ratings.movie_id
GROUP BY title)
WHERE movie_rating = ''