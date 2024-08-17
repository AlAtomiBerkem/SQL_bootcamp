WITH andrey_visit AS (SELECT DISTINCT pizzeria.name
	  FROM person_visits
		 JOIN person ON person_visits.person_id = person.id
		 JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
		 WHERE person.name = 'Andrey'
					),
andrey_order AS (SELECT DISTINCT pizzeria.name
		 FROM person_order
		 JOIN person ON person_order.person_id = person.id
		 JOIN menu ON person_order.menu_id = menu.id
		 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
		 WHERE person.name = 'Andrey'
				   )
SELECT andrey_visit.name
FROM andrey_visit
EXCEPT
(SELECT andrey_order.name
FROM andrey_order)
ORDER BY 1;
