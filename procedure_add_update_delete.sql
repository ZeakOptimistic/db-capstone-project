USE littlelemondb;

-- Task 1
DELIMITER $$

DROP PROCEDURE IF EXISTS AddBooking;
CREATE PROCEDURE AddBooking (
    IN in_booking_id INT,
    IN in_customer_id INT,
    IN in_booking_date DATE,
    IN in_table_number INT,
    IN in_staff_id INT
)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber, StaffID)
    VALUES (in_booking_id, in_customer_id, in_booking_date, in_table_number, in_staff_id);
END $$

DELIMITER ;

-- CALL AddBooking(6, 2, '2022-10-16', 4, 1);

-- Task 2

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking (
    IN in_booking_id INT,
    IN in_new_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = in_new_date
    WHERE BookingID = in_booking_id;
END $$

DELIMITER ;

-- CALL UpdateBooking(6, '2022-10-20');

-- Task 3

DELIMITER $$
DROP PROCEDURE IF EXISTS CancelBooking;
CREATE PROCEDURE CancelBooking (
    IN in_booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = in_booking_id;
END $$

DELIMITER ;

-- CALL CancelBooking(4);

