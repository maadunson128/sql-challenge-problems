--schema and dataset
CREATE TABLE sf_transactions (
    id INT,
    created_at TIMESTAMP,
    value INT,
    purchase_id INT
);

INSERT INTO sf_transactions (id, created_at, value, purchase_id) VALUES
(1, '2019-01-01 00:00:00', 172692, 43), 
(2, '2019-01-05 00:00:00', 177194, 36),
(3, '2019-01-09 00:00:00', 109513, 30),
(4, '2019-01-13 00:00:00', 164911, 30),
(5, '2019-01-17 00:00:00', 198872, 39), 
(6, '2019-01-21 00:00:00', 184853, 31),
(7, '2019-01-25 00:00:00', 186817, 26), 
(8, '2019-01-29 00:00:00', 137784, 22),
(9, '2019-02-02 00:00:00', 140032, 25), 
(10, '2019-02-06 00:00:00', 116948, 43), 
(11, '2019-02-10 00:00:00', 162515, 25), 
(12, '2019-02-14 00:00:00', 114256, 12), 
(13, '2019-02-18 00:00:00', 197465, 48), 
(14, '2019-02-22 00:00:00', 120741, 20), 
(15, '2019-02-26 00:00:00', 100074, 49), 
(16, '2019-03-02 00:00:00', 157548, 19), 
(17, '2019-03-06 00:00:00', 105506, 16), 
(18, '2019-03-10 00:00:00', 189351, 46), 
(19, '2019-03-14 00:00:00', 191231, 29), 
(20, '2019-03-18 00:00:00', 120575, 44), 
(21, '2019-03-22 00:00:00', 151688, 47), 
(22, '2019-03-26 00:00:00', 102327, 18), 
(23, '2019-03-30 00:00:00', 156147, 25);

SELECT * FROM sf_transactions

--ACTUAL QUERY
WITH revenue_month AS(
	SELECT 
		TO_CHAR(created_at, 'YYYY-MM') AS DATE,
		SUM(value) as Revenue
	FROM sf_transactions
	GROUP BY TO_CHAR(created_at, 'YYYY-MM')
),
previous_revenue AS(
	SELECT
		date,
		revenue,
		LAG(revenue) OVER (ORDER BY date) AS prev_revenue
	FROM revenue_month
)
SELECT
	date,
	revenue,
	prev_revenue,
	ROUND(((revenue::NUMERIC-prev_revenue::NUMERIC)/ prev_revenue::NUMERIC * 100), 2) AS change
FROM previous_revenue
