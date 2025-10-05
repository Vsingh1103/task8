DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN customer_id INT)
BEGIN
    SELECT OrderID, OrderDate, TotalAmount
    FROM Orders
    WHERE CustomerID = customer_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalculateDiscount(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    IF amount > 1000 THEN
        SET discount = amount * 0.1;  -- 10% discount
    ELSE
        SET discount = amount * 0.05; -- 5% discount
    END IF;
    RETURN discount;
END$$

DELIMITER ;

SELECT paymentID, Amount, CalculateDiscount(Amount) AS Discount
FROM payment;




 
