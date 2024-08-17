SELECT missing_date::DATE
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
    LEFT JOIN (
        SELECT *
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2 AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
    ) AS castom ON missing_date = castom.visit_date
WHERE castom.person_id is NULL
ORDER BY missing_date ASC;
