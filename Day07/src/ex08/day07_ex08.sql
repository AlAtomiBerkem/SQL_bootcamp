select person.address, pizzeria.name, count(*) AS count_of_orders
from person_order
inner join person ON person_order.person_id = person.id
inner join menu ON person_order.menu_id = menu.id
inner join pizzeria ON menu.pizzeria_id = pizzeria.id
group by 2, 1
order by 1, 2;

