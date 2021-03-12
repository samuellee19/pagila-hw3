/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT sq1.title
FROM (SELECT title
    FROM (SELECT title, unnest(special_features) AS sf
        FROM film) AS sq1a
    WHERE sf = 'Behind the Scenes') AS sq1
INNER JOIN (SELECT title
    FROM (SELECT title, unnest(special_features) AS sf
        FROM film) AS sq2a
    WHERE sf = 'Trailers') AS sq2
ON sq1.title = sq2.title
ORDER BY title ASC;
