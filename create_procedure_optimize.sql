USE littlelemondb;
DROP PROCEDURE IF EXISTS GetMaxQuantity;
DROP PROCEDURE IF EXISTS CancelOrder;

-- Task 1: Procedure to get max quantity
DELIMITER $$
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS "Max Quantity in Orders" FROM Orders;
END $$
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2: Prepared statement for order details by customer ID
PREPARE GetOrderDetail FROM
    'SELECT OrderID, Quantity, TotalCost
        FROM Orders
        WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3: Procedure to cancel an order

DELIMITER $$
CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE Orders.OrderID = order_id;
END $$
DELIMITER ;
DELETE FROM Delivery_status
WHERE OrderID = 3;	
DELETE FROM OrdersMenu WHERE OrderID = 3;
CALL CancelOrder(3);


