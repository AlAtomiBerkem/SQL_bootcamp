CREATE TABLE IF NOT EXISTS salesman ( 
	point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INT NOT NULL
);
INSERT INTO salesman VALUES 
('A', 'B', 10),
('B', 'A', 10),
('B', 'C', 35),
('C', 'B', 35),
('B', 'D', 25),
('D', 'B', 25),
('D', 'C', 30),
('C', 'D', 30),
('D', 'A', 20),
('A', 'D', 20),
('C', 'A', 15),
('A', 'C', 15);

CREATE OR REPLACE VIEW v_path_way AS (
WITH RECURSIVE p(last_point, tour) AS (
    SELECT
        point1,
        ARRAY[point1]::VARCHAR[]::VARCHAR(1)[], 0 AS cost
    FROM salesman
    WHERE point1 = 'A'

    UNION

    SELECT
        salesman.point2 AS last_point,
        (p.tour || ARRAY[salesman.point2])::VARCHAR[]::VARCHAR(1)[],
        p.cost + salesman.cost
    FROM salesman, p
    WHERE salesman.point1 = p.last_point
    AND NOT salesman.point2 = ANY(p.tour)
), result_path AS (
    SELECT
        array_append(tour, 'A') AS tour,
        cost + (SELECT cost FROM salesman WHERE point1 = p.last_point AND point2 = 'A' ORDER BY cost LIMIT 1) as cost
    FROM p
    WHERE (SELECT array_length(p.tour, 1)) = 4
)
SELECT
    cost AS total_cost,
    tour
FROM result_path
);

SELECT tour, total_cost
FROM v_path_way
WHERE total_cost = (SELECT MIN(total_cost) FROM v_path_way)
ORDER BY total_cost, tour;

