CREATE DATABASE Sales_datebase;

CREATE TABLE Sales_sample (
    Product_Id INTEGER,
    Region VARCHAR (50),
    Date DATE,
    Sales_Amount NUMERIC
);

INSERT INTO Sales_sample (Product_Id,Region,Date,Sales_Amount)
VALUES 
(1,'East','2023-10-01',1000),
(2,'North','2023-10-02',1050),
(3,'West','2023-10-03',1150),
(4,'East','2023-10-04',1200),
(5,'West','2023-10-05',1300),
(6,'North','2023-10-06',1350),
(7,'South','2023-10-07',1400),
(8,'South','2023-10-08',1500),
(9,'West','2023-10-09',2000),
(10,'North','2023-10-10',2500);


SELECT Region,Product_Id,SUM(Sales_Amount) as Total_sales
From Sales_sample
Group BY Region,Product_Id
Order BY Region,Product_Id;

SELECT Product_Id,Region,SUM(Sales_Amount) as Total_sales
FROM Sales_sample
Group BY Product_Id,Region
Order BY Product_Id,Region;


SELECT a.Product_Id,a.Region,a.Date,SUM(a.Sales_Amount) as Total_sales
FROM Sales_sample a
GROUP BY ROLLUP(a.Region,a.Product_Id,a.Date);


SELECT *
FROM Sales_sample
WHERE Region = 'East' and Date Between '2023-10-01' and '2023-10-31';

Select*
FROM Sales_sample
WHERE Product_Id = 1 and Region = 'East' and DATE = '2023-10-01';
