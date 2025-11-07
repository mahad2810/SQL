/*
===================================================================
File: average_selling_price.sql
Author: Mahad Iqbal
Date: YYYY-MM-DD
Description:
    SQL script to calculate the average selling price for each product
    from the 'Prices' and 'UnitsSold' tables.

    The average price is calculated as:
        (SUM of (units * price)) / (SUM of units)

    If a product has no sold units, its average selling price is 0.

===================================================================
Table Schemas:
-------------------------------------------------------------------
Prices
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |  -- Part of Primary Key
| start_date    | date    |  -- Part of Primary Key
| end_date      | date    |  -- Part of Primary Key
| price         | int     |
-------------------------------------------------------------------

UnitsSold
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
-------------------------------------------------------------------
*/

-- Step 1: Join Prices and UnitsSold based on matching product_id
--         and date ranges (purchase_date falls between start_date and end_date).
-- Step 2: Calculate total revenue (units * price) and total units sold.
-- Step 3: Divide total revenue by total units to get average price.
-- Step 4: Round the average to 2 decimal places.
-- Step 5: Include products even if no units were sold (use LEFT JOIN).

SELECT 
    p.product_id,
    ROUND(
        IFNULL(SUM(u.units * p.price) / SUM(u.units), 0),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
