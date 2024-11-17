CREATE TABLE Triangle (
 level INT
);

SELECT * FROM Triangle

WITH RECURSIVE Triangle AS (
	SELECT 1 AS level --Base Query
	UNION ALL 
	--Recursive Query
	SELECT level + 1
	FROM Triangle
	WHERE level < 5
)
SELECT 
	REPEAT('*', level) AS triangle_level
FROM Triangle

