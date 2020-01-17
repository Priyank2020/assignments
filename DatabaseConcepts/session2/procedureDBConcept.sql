-- //using the created db
-- use PriyankKotakDB;

-- //order table
-- CREATE TABLE Orders (CustomerId int,OrderId int);
-- INSERT INTO Orders VALUES ( 2 , 10308);
-- INSERT INTO Orders VALUES ( 37 , 10309);
-- INSERT INTO Orders VALUES ( 77 , 10310);	
-- SELECT * FROM Orders;

-- //customer table
 -- CREATE TABLE Customers (CustomerId int,CustomerName Varchar(20));
-- INSERT INTO Customers VALUES ( 1 , 'Raj');
-- INSERT INTO Customers VALUES ( 2 , 'Priyank');
-- INSERT INTO Customers VALUES ( 3 , 'Karan');	
-- SELECT * FROM Customers;

-- //Create Procedure Syntax
-- DELIMITER $$
-- CREATE PROCEDURE demoo(IN CID int)
-- BEGIN
-- SELECT Orders.OrderID, Customers.CustomerName
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID = CID and Customers.CustomerID = CID;
-- END $$
-- DELIMITER ;
	
-- //to call Procedure
-- CALL `priyankkotakdb`.`demoo`();
