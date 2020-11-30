/*
Udacity's - 'Programming for Data Science' certified Nanodegree Program
SQL > Lesson 8 > Project: Investigate the 'Sakila DVD rental database'
Q2: Which movie category were popular in the 4th
quartile of rental duration?
*/
WITH TABLE1 AS
(SELECT c.name category,
	NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile

FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name IN ('Animation', 'Children','Classics','Comedy','Family','Music')
ORDER BY category, standard_quartile)

SELECT TABLE1.category, TABLE1.standard_quartile, COUNT(*)
FROM TABLE1
GROUP BY 1,2
ORDER BY category, standard_quartile;