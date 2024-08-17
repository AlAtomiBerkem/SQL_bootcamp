SELECT name
from person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON menu_id = menu.id
	
WHERE (person.address = 'Moscow' 
		OR person.address = 'Samara') 
	
	AND (pizza_name = 'pepperoni pizza' 
		OR pizza_name = 'mushroom pizza')
	AND person.gender = 'male' 
ORDER BY name DESC;
