COMMENT ON TABLE person_discounts IS 'this table calculates personal discounts for visitors';
COMMENT ON COLUMN person_discounts.id IS 'a column that connects all other columns from this table by ID';
COMMENT ON COLUMN person_discounts.person_id IS 'this column links the persons ID from the person ID table and other related tables';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'connects pizzeria_id from other tables, for example pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'the column calculates personal discounts for each visitor';

