/*
Udacity's - 'Programming for Data Science' certified Nanodegree Program
SQL > Lesson 8 > Project: Investigate the 'Sakila DVD rental database'
Q3): Compare the monthly performance of stores in terms of rental order processed in year 2005.
*/
 WITH Table1 AS
 (SELECT DATE_PART('month', rental_date) as month, DATE_PART('year', rental_date) as year, store_id, COUNT (film_id) OVER (PARTITION BY DATE_TRUNC('month', rental_date) ORDER BY store_id) as count_rentals
 FROM rental r
 JOIN inventory i
 ON i.inventory_id = r.inventory_id)
 
 SELECT Table1.month rental_month, Table1.year rental_year, Table1.store_id, COUNT(count_rentals) count_rentals
 FROM Table1
 GROUP BY 1, 2, 3
 ORDER BY count_rentals DESC;