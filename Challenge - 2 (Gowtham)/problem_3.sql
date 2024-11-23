CREATE TABLE Ads (
 AdID INT PRIMARY KEY,
 AdName VARCHAR(100),
 Views INT,
 Clicks INT,
 Conversions INT,
 Revenue DECIMAL(10, 2)
);

INSERT INTO Ads (AdID, AdName, Views, Clicks, Conversions, Revenue) VALUES 
(1, 'Ad 1', 1000, 100, 10, 500.00),
(2, 'Ad 2', 2000, 150, 20, 1000.00),
(3, 'Ad 3', 1500, 120, 15, 750.00),
(4, 'Ad 4', 1800, 180, 25, 1250.00);

SELECT * FROM Ads


--Actual Query
SELECT 
	adid,
	adname,
	views,
	clicks,
	ROUND(clicks * 100.0/ views, 2) AS "Click Through Rate",
	ROUND(conversions * 100.0 / clicks,2) AS "Conversion Rate",
	ROUND(revenue / conversions, 2) AS "Revenue per Conversion"
FROM Ads
