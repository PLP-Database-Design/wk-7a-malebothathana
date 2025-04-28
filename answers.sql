-- QUESTION 1


-- Creating the database for normalizationdb
CREATE DATABASE normalisationdb;

-- Using the created database
USE normalisationdb;


-- Creating the normalized table structure for 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting the transformed data into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Selecting data to verify transformation
SELECT * FROM ProductDetail_1NF;



-- QUESTION 2


-- using the same database for 2NF to remove partial dependency
USE normalisationdb;


-- SQL for Creating the Orders table to store order-level data
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- my aproach to creating the OrderItems table to store product-level data
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into the Orders table (removing partial dependency)
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Inserting the data into the OrderItems table (maintaining relationships)
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Selecting the data to verify normalizationf2
SELECT * FROM Orders;
SELECT * FROM OrderItems;
