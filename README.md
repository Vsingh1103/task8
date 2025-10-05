# task8
# SQL Assignment — Reusable SQL Blocks

## Objective
Learn to create **reusable SQL blocks** using **Stored Procedures** and **Functions** to modularize SQL logic and make queries more efficient

## Tools
- DB Browser for SQLite** *(for basic SQL queries only)* 
- MySQL Workbench** *(recommended — supports stored procedures & functions)

## Deliverables
- One **Stored Procedure**  
- One **Function**

Both should use **parameters** and **conditional logic**.

###  1. Stored Procedure

**Purpose:** Retrieve all orders for a specific customer.

DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN customer_id INT)
BEGIN
    SELECT OrderID, OrderDate, TotalAmount
    FROM Orders
    WHERE CustomerID = customer_id;
END$$

DELIMITER ;
##

This stored procedure accepts a customer ID and retrieves all their orders from the Orders table.
You can reuse it any time instead of rewriting the same query.
CALL GetCustomerOrders(3);

### function

DELIMITER $$

CREATE FUNCTION CalculateDiscount(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    
    -- Conditional logic
    IF amount > 1000 THEN
        SET discount = amount * 0.1;  -- 10% discount
    ELSE
        SET discount = amount * 0.05; -- 5% discount
    END IF;
    
    RETURN discount;
END$$

DELIMITER ;


###--The function takes an amount as input, applies conditional logic, and returns a discount value.
SELECT 
    OrderID,
    TotalAmount,
    CalculateDiscount(TotalAmount) AS Discount
FROM Orders;









