--session 1
UPDATE pizzeria SET rating = 5 WHERE pizzeria.name = 'Pizza Hut';
--session 2
SELECT * FROM pizzeria;
--session 1 
COMMIT;
--session 2
SELECT * FROM pizzeria;

