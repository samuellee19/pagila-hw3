/*
 * Count the number of movies that contain each type of special feature.
 */

SELECT DISTINCT(unnest(special_features)) AS special_features, COUNT(*) FROM film
GROUP BY unnest(special_features)
ORDER BY special_features ASC;
