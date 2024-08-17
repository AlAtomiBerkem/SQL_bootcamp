SELECT name
FROM person
    JOIN person_order ON person.id = person_id
    JOIN menu ON menu_id = menu.id
WHERE person.gender = 'female'
    AND pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name
FROM person
    JOIN person_order ON person.id = person_id
    JOIN menu ON menu_id = menu.id
WHERE person.gender = 'female'
    AND pizza_name = 'cheese pizza'
ORDER BY name
