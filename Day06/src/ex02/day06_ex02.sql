SELECT person.name, m.pizza_name, m.price, 
ROUND(m.price - m.price * (pd.discount * 0.01)) AS discount_price, pizzeria.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN person ON po.person_id = person.id
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
	
JOIN person_discounts pd ON m.pizzeria_id = pd.pizzeria_id
	AND pd.person_id = po.person_id
	
ORDER BY 1,2;
