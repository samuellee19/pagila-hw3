/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT("Actor Name") AS "Actor Name"
FROM (SELECT first_name || ' ' || last_name AS "Actor Name" FROM actor 
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    WHERE film_id IN (SELECT film_id
        FROM (SELECT film_id, first_name || ' ' || last_name AS "Actor Name"
            FROM film_actor
            INNER JOIN actor ON film_actor.actor_id = actor.actor_id) AS sq1a
        WHERE "Actor Name" = 'RUSSELL BACALL')
    ) AS sq1
WHERE "Actor Name" != 'RUSSELL BACALL'
ORDER BY "Actor Name" ASC;
