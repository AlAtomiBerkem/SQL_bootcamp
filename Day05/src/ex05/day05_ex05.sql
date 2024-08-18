CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id) 
	WHERE order_date = '2022-01-01';


set enable_seqscan = off;
EXPLAIN ANALYZE
select person_id, menu_id, order_date
from person_order
where order_date = '2022-01-01'
order by 1,2;
