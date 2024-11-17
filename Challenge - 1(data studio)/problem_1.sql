--table schema
CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);

SELECT * FROM famous


--actual query
WITH distinct_users AS (
	SELECT DISTINCT user_id FROM famous
	UNION 
	SELECT DISTINCT follower_id FROM famous
),
followers AS (
	SELECT user_id, COUNT(*) as follower_count
	FROM famous 
	GROUP BY user_id
)
SELECT 
	f.user_id,
	f.follower_count,
	(f.follower_count * 100.0)/(SELECT COUNT(*) FROM distinct_users) AS famous_percentage
FROM followers f
ORDER BY user_id;


