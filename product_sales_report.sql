-- -----------------------------------------------------
-- File Name: product_sales_report.sql
-- Description: Retrieve product name, year, and price from Sales and Product tables
-- Author: Mahad Iqbal
-- -----------------------------------------------------

-- Select the product name, year, and price for each sale
SELECT 
    p.product_name,
    s.year,
    s.price
FROM 
    Sales AS s
JOIN 
    Product AS p
ON 
    s.product_id = p.product_id;

-- -----------------------------------------------------
-- Example Output:
-- +--------------+-------+-------+
-- | product_name | year  | price |
-- +--------------+-------+-------+
-- | Nokia        | 2008  | 5000  |
-- | Nokia        | 2009  | 5000  |
-- | Apple        | 2011  | 9000  |
-- +--------------+-------+-------+
-- -----------------------------------------------------
