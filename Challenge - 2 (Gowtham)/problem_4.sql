--𝐒𝐜𝐡𝐞𝐦𝐚
CREATE TABLE calls (
 call_id INT PRIMARY KEY,
 caller_id INT,
 receiver_id INT,
 call_timestamp TIMESTAMP
);

INSERT INTO calls (call_id, caller_id, receiver_id, call_timestamp) VALUES
(1, 101, 102, '2024-10-01 08:00:00'),
(2, 102, 101, '2024-10-01 08:05:00'),
(3, 101, 103, '2024-10-01 09:00:00'),
(4, 102, 103, '2024-10-01 09:30:00'),
(5, 101, 102, '2024-10-01 10:00:00');


--Actual Query to the solution
SELECT
	LEAST(caller_id, receiver_id) AS person1,
	GREATEST(caller_id, receiver_id) AS person2,
	COUNT(*) AS call_count
FROM calls
GROUP BY 
	LEAST(caller_id, receiver_id),
	GREATEST(caller_id, receiver_id)
ORDER BY
	person1, person2;