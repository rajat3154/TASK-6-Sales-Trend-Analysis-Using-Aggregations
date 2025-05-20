CREATE DATABASE IF NOT EXISTS sales_data;

USE sales_data;

CREATE TABLE sales (
    order_id VARCHAR(20),
    product VARCHAR(100),
    quantity_ordered INT,
    price_each DECIMAL(10,2),
    order_date DATETIME,
    purchase_address VARCHAR(255)
);


SELECT * FROM SALES;

ALTER TABLE sales
ADD COLUMN month INT,
ADD COLUMN sales DECIMAL(10,2),
ADD COLUMN city VARCHAR(100),
ADD COLUMN hour INT;

SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET 
    month = MONTH(order_date),
    hour = HOUR(order_date),
    sales = quantity_ordered * price_each,
    city = SUBSTRING_INDEX(SUBSTRING_INDEX(purchase_address, ',', -2), ',', 1);
    
SET SQL_SAFE_UPDATES = 1;


SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    sales
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    YEAR(order_date), MONTH(order_date);

