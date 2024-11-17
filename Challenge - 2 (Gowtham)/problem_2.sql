--User_Table
CREATE TABLE User_Table (
 user_id INT PRIMARY KEY,
 join_date DATE
);

INSERT INTO User_Table (user_id, join_date) VALUES
(1, '2024-01-05'),
(2, '2024-02-15'),
(3, '2024-02-25'),
(4, '2024-03-10');

--Product_View_Log
CREATE TABLE Product_View_Log (
 user_id INT,
 product_id INT,
 view_date DATE,
 FOREIGN KEY (user_id) REFERENCES User_Table(user_id)
);

INSERT INTO Product_View_Log (user_id, product_id, view_date) VALUES
(1, 101, '2024-03-05'),
(1, 102, '2024-03-05'),
(1, 103, '2024-03-06'),
(2, 101, '2024-03-10'),
(2, 104, '2024-03-11'),
(2, 105, '2024-03-12'),
(2, 106, '2024-03-13'),
(3, 102, '2024-03-10'),
(3, 103, '2024-03-12'),
(3, 104, '2024-03-15'),
(3, 105, '2024-03-18'),
(3, 106, '2024-03-19');



SELECT * FROM User_Table

SELECT * FROM Product_View_Log

--Actual Query
SELECT 
	user_id,
	COUNT(DISTINCT product_id) AS distinct_views
FROM Product_View_Log
WHERE view_date BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY user_id
HAVING COUNT(DISTINCT product_id) >= 5;