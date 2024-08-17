SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu,  pizzeria
WHERE pizzeria.id = menu.pizzeria_id
AND NOT EXISTS(
    SELECT 1 
    FROM person_order 
    WHERE person_order.menu_id = menu.id)
ORDER BY 1, 2;

