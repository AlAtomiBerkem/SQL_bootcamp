SELECT p.name AS name, COUNT (4) AS count_of_visits
from person_visits pv
	INNER JOIN person AS p ON pv.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;
