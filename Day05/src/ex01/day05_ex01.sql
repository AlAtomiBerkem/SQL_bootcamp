SET enable_seqscan = off;
EXPLAIN ANALYSE
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
