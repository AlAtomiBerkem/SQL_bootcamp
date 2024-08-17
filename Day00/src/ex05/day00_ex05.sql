SELECT 
	(SELECT person.name FROM person WHERE person_order.person_id = person.id) AS person_lol
FROM person_order
WHERE (menu_id BETWEEN 13 AND 14 OR menu_id = 18) AND order_date = '2022-01-07';
 
