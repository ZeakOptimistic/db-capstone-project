USE littlelemondb;

-- Task 1
CREATE OR REPLACE VIEW OrdersView AS
SELECT 
    OrderID,
    Quantity,
    TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2

SELECT C.CustomerID, C.Name, O.OrderID, O.TotalCost, E.ItemName, E.Category
FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
INNER JOIN OrdersMenu AS D ON O.OrderID = D.OrderID
INNER JOIN Menu AS E ON D.MenuID = E.MenuID
WHERE O.TotalCost > 75;

-- Task 3

SELECT m.ItemName
FROM Menu AS m
WHERE m.MenuID = ANY (
    SELECT MenuID
    FROM OrdersMenu
    GROUP BY MenuID
    HAVING SUM(Quantity) > 2
);