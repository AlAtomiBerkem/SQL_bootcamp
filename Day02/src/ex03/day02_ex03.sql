WITH filtret_data AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::DATE AS visits_date
),
missing_date AS ( 
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
    AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT visits_date
FROM filtret_data
LEFT JOIN missing_date ON missing_date.visit_date = filtret_data.visits_date
WHERE missing_date.visit_date IS NULL
ORDER BY 1 ASC;
