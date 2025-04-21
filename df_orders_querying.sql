CREATE DATABASE retailOrders;
USE retailOrders;

CREATE TABLE df_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(20),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price DECIMAL(7,2),
    profit DECIMAL(7,2)
);

CREATE USER 'project_user'@'localhost' IDENTIFIED BY '123456789';

GRANT ALL PRIVILEGES ON retailorders.* TO 'project_user'@'localhost';

FLUSH PRIVILEGES;


select * from df_orders;


#find top 10 highest reveue generating products 
select product_id,sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc
limit 10;

#popular categories by quantity sold
SELECT category, SUM(quantity) AS total_quantity
FROM df_orders
GROUP BY category
ORDER BY total_quantity DESC;

#region wise and revenue and profit
SELECT region, SUM(sale_price) AS total_sales, SUM(profit) AS total_profit
FROM df_orders
GROUP BY region
ORDER BY total_sales DESC;

#profit margin per product
SELECT product_id, 
       SUM(profit) AS total_profit, 
       SUM(sale_price) AS total_sales,
       ROUND(SUM(profit)/SUM(sale_price) * 100, 2) AS profit_margin_pct
FROM df_orders
GROUP BY product_id
ORDER BY profit_margin_pct DESC
LIMIT 10;


commit

