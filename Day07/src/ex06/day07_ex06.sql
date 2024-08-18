SELECT pizzeria.name, 
       COUNT(*) AS count_of_orders, 
       ROUND(AVG(m.price)) AS average_price, --ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price) AS max_price, 
       MIN(m.price) AS min_price
FROM person_order
INNER JOIN menu m ON person_order.menu_id = m.id
INNER JOIN pizzeria ON m.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;

