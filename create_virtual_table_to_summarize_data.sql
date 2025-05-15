-- Task 1
-- In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
-- Here’s some guidance around completing this task: 
-- Use a CREATE VIEW statement.
-- Extract the order id, quantity and cost data from the Orders table.
-- Filter data from the orders table based on orders with a quantity greater than 2. 
-- You can query the OrdersView table using the following syntax:

USE littlelemondb;

CREATE OR REPLACE VIEW OrdersView AS
SELECT 
    OrderID,
    Quantity,
    TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2
-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
-- Customers table: The customer id and full name.
-- Orders table: The order id and cost.
-- Menus table: The menus name.
-- MenusItems table: course name and starter name.
-- The result set should be sorted by the lowest cost amount.

SELECT C.CustomerID, C.Name, O.OrderID, O.TotalCost, E.ItemName, E.Category
FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
INNER JOIN OrdersMenu AS D ON O.OrderID = D.OrderID
INNER JOIN Menu AS E ON D.MenuID = E.MenuID
WHERE O.TotalCost > 75;


-- Task 3
-- For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
-- Here’s some guidance around completing this task: 
-- Use the ANY operator in a subquery
-- The outer query should be used to select the menu name from the menus table.
-- The inner query should check if any item quantity in the order table is more than 2. 

SELECT m.ItemName
FROM Menu AS m
WHERE m.MenuID = ANY (
    SELECT MenuID
    FROM OrdersMenu
    GROUP BY MenuID
    HAVING SUM(Quantity) > 2
);

