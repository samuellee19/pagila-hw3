/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT DISTINCT(first_name || ' ' || last_name) AS "Actor Name" FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_id IN (SELECT film_id FROM film_actor
    INNER JOIN actor ON film_actor.actor_id = actor.actor_id
    WHERE film_id NOT IN (SELECT film_id
        FROM (SELECT first_name || ' ' || last_name AS "Actor Name", film_id FROM actor
            INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
            WHERE film_id IN (SELECT film_id
                FROM (SELECT film_id, first_name || ' ' || last_name AS "Actor Name"
                    FROM film_actor
                    INNER JOIN actor ON film_actor.actor_id = actor.actor_id) AS sq1a
                WHERE "Actor Name" = 'RUSSELL BACALL')
            ) AS sq1
        WHERE "Actor Name" != 'RUSSELL BACALL')
    AND film_actor.actor_id IN (SELECT actor.actor_id
        FROM (SELECT first_name || ' ' || last_name AS "Actor Name" FROM actor
            INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
            WHERE film_id IN (SELECT film_id
                FROM (SELECT film_id, first_name || ' ' || last_name AS "Actor Name"
                    FROM film_actor
                    INNER JOIN actor ON film_actor.actor_id = actor.actor_id) AS sql1
                WHERE "Actor Name" = 'RUSSELL BACALL')
        ) AS sq1
        WHERE "Actor Name" != 'RUSSELL BACALL')
    )
AND actor.actor_id NOT IN (SELECT actor_id
    FROM (SELECT actor.actor_id, first_name || ' ' || last_name AS "Actor Name" FROM actor
        INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
        WHERE film_id IN (SELECT film_id
            FROM (SELECT film_id, first_name || ' ' || last_name AS "Actor Name"
                FROM film_actor
                INNER JOIN actor ON film_actor.actor_id = actor.actor_id) AS sq1a
            WHERE "Actor Name" = 'RUSSELL BACALL')
        ) AS sq1
    WHERE "Actor Name" != 'RUSSELL BACALL'
    ORDER BY "Actor Name" ASC)
ORDER BY "Actor Name" ASC;
