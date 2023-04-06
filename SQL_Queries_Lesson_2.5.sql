USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';
-- How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT count(inventory_id) FROM sakila.inventory;

SELECT DISTINCT film_id FROM sakila.inventory;
-- What are the shortest and longest movie duration? Name the values max_duration and .
SELECT 
   min(length) as min_duration, 
   max(length) as max_duration 
FROM sakila.film;
-- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
   CONVERT(avg(length), TIME) as 'AVERAGE'
FROM sakila.film;
-- How many distinct (different) actors' last names are there?
SELECT DISTINCT last_name FROM sakila.actor;
-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT 
	max(rental_date)-min(rental_date) as Operating_days 
FROM sakila.rental;
-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT rental_id, rental_date, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday from sakila.rental
LIMIT 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, rental_date, 
       DATE_FORMAT(rental_date, '%M') AS month, 
       DATE_FORMAT(rental_date, '%W') AS weekday,
       CASE 
          WHEN WEEKDAY(rental_date) IN (5,6) THEN 'weekend'
          ELSE 'workday'
       END AS day_type
FROM sakila.rental;
-- Get release years.
SELECT title, release_year
FROM sakila.film;
-- Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';
-- Get all films which title ends with APOLLO.
SELECT title FROM sakila.film
WHERE title LIKE '%APOLLO';
-- Get 10 the longest films
SELECT * FROM film
ORDER BY length DESC
LIMIT 10;
-- How many films include Behind the Scenes content?
SELECT COUNT(*) AS Behind_scenes FROM film
WHERE special_features LIKE '%Behind%Scenes%';