--DAY 6

--Schema
CREATE TABLE items(
	item_id INT,
	item_category VARCHAR(50)
);

CREATE TABLE orders(
	order_id INT,
	item_id INT,
	order_date DATE,
	quantity INT
);

-- Insert sample data into the Items table
INSERT INTO items (item_id, item_category)
VALUES 
	(1, 'Electronics'),
	(2, 'Clothing'),
	(3, 'Books');

-- Insert sample data into the Orders table
INSERT INTO orders (order_id, item_id, order_date, quantity) 
VALUES 
	(1, 1, '2024-10-01', 10),
	(2, 1, '2024-10-02', 15),
	(3, 2, '2024-10-01', 20),
	(4, 2, '2024-10-04', 25),
	(5, 1, '2024-10-01', 5),
	(6, 3, '2024-10-03', 8),
	(7, 3, '2024-10-02', 12),
	(8, 2, '2024-10-02', 18),
	(9, 1, '2024-10-05', 30),
	(10, 3, '2024-10-01', 7);

SELECT * FROM items

SELECT * FROM orders


--Actual Query to solve the problem
SELECT
	b.item_category AS category,
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 0 THEN a.quantity ELSE 0 END) AS "Monday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 1 THEN a.quantity ELSE 0 END) AS "Tuesday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 2 THEN a.quantity ELSE 0 END) AS "Wednesday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 3 THEN a.quantity ELSE 0 END) AS "Thursday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 4 THEN a.quantity ELSE 0 END) AS "Friday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 5 THEN a.quantity ELSE 0 END) AS "Saturday",
	SUM(CASE WHEN (EXTRACT(dow FROM a.order_date) + 6) % 7 = 6 THEN a.quantity ELSE 0 END) AS "Sunday"
FROM orders a
RIGHT JOIN items b ON a.item_id = b.item_id
GROUP BY b.item_category