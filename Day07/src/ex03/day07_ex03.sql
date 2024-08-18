select q.name, sum(q.total_count) AS total_count
from ((select pi.name,
count (pizzeria_id) as total_count
from person_visits as pv
join pizzeria pi on pv.pizzeria_id = pi.id
       group by 1
       order by 2 desc)
union all
      (select pi.name, count(pi.name) as total_count
       from person_order po
                join menu m on po.menu_id = m.id
                join pizzeria pi on m.pizzeria_id = pi.id
       group by 1
       order by 2 desc)) q
group by q.name
order by 2 desc, 1 asc;
