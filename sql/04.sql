/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT("Actor Name") AS "Actor Name"
FROM (SELECT first_name || ' ' || last_name AS "Actor Name", unnest(special_features) AS sf
    FROM actor
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film_actor.film_id = film.film_id) AS a
WHERE sf = 'Behind the Scenes'
ORDER BY "Actor Name" ASC;

