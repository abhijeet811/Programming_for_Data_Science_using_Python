/*
Udacity's - 'Programming for Data Science' certified Nanodegree Program
SQL > Lesson 8 > Project: Investigate the 'Sakila DVD rental database'
Q1: Which are the most and least rented out family
movie categories?
*/
WITH Table1 as (SELECT *
FROM category c
JOIN film_category fc
ON fc.category_id = c.category_id
JOIN film f
ON fc.film_id = f.film_id
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music'))

SELECT Table1.title Film_Title, Table1.name Category_Name, COUNT(Table1.rental_id) Rentle_Count
FROM Table1
GROUP BY 1,2
ORDER BY 2,1;