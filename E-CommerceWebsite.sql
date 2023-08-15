create database EcommerceWebsite;

use EcommerceWebsite;

CREATE TABLE Category (
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL
);

INSERT INTO Category (CAT_ID, CAT_NAME) 
VALUES 
  (1, 'BOOKS'),
  (2, 'GAMES'),
  (3, 'GROCERIES'),
  (4, 'ELECTRONICS'),
  (5, 'CLOTHES');
  select * from Category;
 
 CREATE TABLE Product (
 PRO_ID INT PRIMARY KEY,
 PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
 PRO_DESC VARCHAR(60),
 CAT_ID INT,
 FOREIGN KEY (CAT_ID) REFERENCES Category (CAT_ID)
 );
 
 INSERT INTO Product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) 
 VALUES
  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
   (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
    (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
    (6, 'MILK 1L', 'Toned Milk', 3),
    (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
    (9, 'Project IGI', 'compatible with windows 7 and above', 2),
    (10, 'Hoodie Black GUCCI', 'for 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1); 
    select * from Product;
    
  CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
  );
  
  INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
  VALUES
    (1, 'Rajesh Retails', 'Delhi', '1234567890'),
    (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
    (3, 'Knome products', 'Banglore', '9785462315'),
    (4, 'Bansal Retails', 'Kochi', '8975463285'),
    (5, 'Mittal Ltd.', 'Lucknow', '7898456532');
    select * from supplier;
    
  CREATE TABLE supplier_pricing (
  PRICING_ID INT PRIMARY KEY,
  PRO_ID INT,
  SUPP_ID INT,
  SUPP_PRICE INT DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES Product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
  );
  
  INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
  VALUES
   (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000),
    (6, 12, 2, 780),
    (7, 12, 4, 789),
    (8, 3, 1, 31000),
    (9, 1, 5, 1450),
    (10, 4, 2, 999),
    (11, 7, 3, 549),
    (12, 7, 4, 529),
    (13, 6, 2, 105),
    (14, 6, 1, 99),
    (15, 2, 5, 2999),
    (16, 5, 2, 2999);
    select * from supplier_pricing;
    
    CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
    );
    
    INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
  VALUES
   (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
    (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');
    select * from customer;
    
    CREATE TABLE Orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
    );
    
  INSERT INTO Orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
    VALUES
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);
    select * from Orders;
    
    CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES Orders (ORD_ID)
    );
    
   INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
   VALUES
    (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);
    select * from rating;
    
    
    --- Q4
    SELECT c.CUS_GENDER,
    COUNT(DISTINCT c.CUS_ID) AS Total_Customers
    FROM customer c
    JOIN Orders o ON c.CUS_ID = o.CUS_ID
    WHERE o.ORD_AMOUNT >=300
    GROUP BY c.CUS_GENDER;
    
    --- Q5
SELECT Orders.ORD_ID, Orders.ORD_AMOUNT, Orders.ORD_DATE, product.PRO_NAME
FROM Orders
INNER JOIN supplier_pricing ON Orders.PRICING_ID = supplier_pricing.PRICING_ID
INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE Orders.CUS_ID = 2;

--- Q6
SELECT supplier.SUPP_ID, supplier.SUPP_NAME, supplier.SUPP_CITY, supplier.SUPP_PHONE
FROM supplier
INNER JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier.SUPP_ID, supplier.SUPP_NAME, supplier.SUPP_CITY, supplier.SUPP_PHONE
HAVING COUNT(DISTINCT supplier_pricing.PRO_ID) > 1;

--- Q7
SELECT category.CAT_ID, category.CAT_NAME, product.PRO_NAME, MIN(supplier_pricing.SUPP_PRICE) AS Least_Price
FROM category
INNER JOIN product ON category.CAT_ID = product.CAT_ID
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
GROUP BY category.CAT_ID, category.CAT_NAME, product.PRO_NAME;


--- Q8
SELECT product.PRO_ID, product.PRO_NAME
FROM product
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
INNER JOIN Orders ON supplier_pricing.PRICING_ID = Orders.PRICING_ID
WHERE Orders.ORD_DATE > '2021-10-05';

--- Q9
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

    --- Q10
    DELIMITER //
CREATE PROCEDURE GetSupplierRatingAndService()
BEGIN
    SELECT
        supplier.SUPP_ID,
        supplier.SUPP_NAME,
        AVG(rating.RAT_RATSTARS) AS Avg_Rating,
        CASE
            WHEN AVG(rating.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(rating.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(rating.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM
        supplier
    LEFT JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
    LEFT JOIN Orders ON supplier_pricing.PRICING_ID = Orders.PRICING_ID
    LEFT JOIN rating ON Orders.ORD_ID = rating.ORD_ID
    GROUP BY supplier.SUPP_ID, supplier.SUPP_NAME;
END //
DELIMITER ;

    
    
    
    
    
    
    
    
    
  
    
    
  

 
 
  
  
  

