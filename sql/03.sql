/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

SELECT DISTINCT(unnest(a.special_features)) AS special_feature, SUM(a.profit) AS profit
    FROM (SELECT special_features, SUM(amount) AS profit FROM payment
        INNER JOIN rental ON payment.rental_id = rental.rental_id
        INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
        INNER JOIN film ON inventory.film_id = film.film_id
        GROUP BY special_features) AS a
    GROUP BY unnest(a.special_features)
    ORDER BY special_feature ASC;  
