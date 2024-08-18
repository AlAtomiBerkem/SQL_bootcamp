CREATE VIEW v_price_with_discount AS 
SELECT person.name, pizza_name, menu1.price AS price, menu1.price - menu1.price * 0.1 AS discount_price
FROM menu AS menu1
JOIN person_order ON person_order.menu_id = menu1.id
JOIN person ON person.id = person_order.person_id
ORDER BY name, pizza_name;

