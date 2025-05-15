use littlelemondb;

-- Task 1
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, StaffID)
VALUES
(5, '2022-10-10', 5, 1, 2),
(6, '2022-11-12', 3, 3, 4),
(7, '2022-10-11', 2, 2, 1),
(8, '2022-10-13', 1, 4, 3);

SELECT * FROM Bookings;

-- Task 2
DELIMITER $$

CREATE PROCEDURE CheckBooking(
    IN in_date DATE,
    IN in_table INT
)
BEGIN
    DECLARE booked_count INT;

    SELECT COUNT(*) INTO booked_count
    FROM Bookings
    WHERE BookingDate = in_date AND TableNumber = in_table;

    IF booked_count > 0 THEN
        SELECT 'Table is already booked.' AS Status;
    ELSE
        SELECT 'Table is available.' AS Status;
    END IF;
END $$

DELIMITER ;

CALL CheckBooking('2022-10-10', 5); 
CALL CheckBooking('2022-10-12', 5); 

-- Task 3
DELIMITER $$

CREATE PROCEDURE AddValidBooking(
    IN in_date DATE,
    IN in_table INT,
    IN in_customer INT
)
BEGIN
    DECLARE booked_count INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO booked_count
    FROM Bookings
    WHERE BookingDate = in_date AND TableNumber = in_table;

    IF booked_count > 0 THEN
        ROLLBACK;
        SELECT 'Booking failed: table is already booked.' AS Status;
    ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (in_date, in_table, in_customer);
        COMMIT;
        SELECT 'Booking successful.' AS Status;
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking('2022-10-10', 5, 2); 
CALL AddValidBooking('2022-10-12', 4, 2); 


