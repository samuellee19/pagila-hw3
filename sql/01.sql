/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT title FROM film
WHERE rating = 'G' AND
special_features @> ARRAY['Trailers']
ORDER BY title DESC;
