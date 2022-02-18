USE sakila;

select * from film;
select * from actor;
select * from film_actor;

-- List of movies by actor

SELECT *
FROM film_actor
INNER JOIN actor 
ON film_actor.actor_id = actor.actor_id;

-- Count number of movies per actor

SELECT actor.first_name, COUNT(film_actor.film_id) AS number_of_movies
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY actor.first_name;

-- Count movie languages

SELECT language.name, COUNT(film.film_id) AS language
FROM film
RIGHT JOIN language
ON film.language_id = language.language_id
GROUP BY language.name;

-- Calculate average cost for replacement of a film

SELECT AVG(replacement_cost) AS average_cost FROM film;

-- Do a store procedure to update the film

DELIMITER //
CREATE PROCEDURE `sp_updateRating` ()
BEGIN
	UPDATE film SET rating = 'R' where film_id = 80;
END //

CALL sp_updateRating;
