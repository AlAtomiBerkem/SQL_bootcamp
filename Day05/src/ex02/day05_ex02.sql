CREATE INDEX idx_person_name_up ON person (UPPER(name));

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT name
FROM person
WHERE (upper(name)) = 'Nataly'
