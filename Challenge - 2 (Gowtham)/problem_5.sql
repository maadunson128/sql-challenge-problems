--Schema
--Creating table
CREATE TABLE daily_sales(
	sale_date DATE,
	amount_paid DECIMAL(10, 2)
)

--Inserting the data rows
INSERT INTO daily_sales
VALUES
('2024-10-01', 150.00),
('2024-10-02', 200.00),
('2024-10-03', 120.00),
('2024-10-04', 250.00),
('2024-10-05', 180.00),
('2024-10-06', 220.00),
('2024-10-07', 300.00),
('2024-10-08', 250.00);


--Actual query to solve the problem.
SELECT
	sale_date,
	ROUND(AVG(amount_paid) OVER(
		ORDER BY sale_date
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	),2) AS average_amount
FROM daily_sales
ORDER BY sale_date



