 🛒 Retail Orders Data Analysis & ETL

## 📌 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline using Python and SQL to analyze retail order data. The analysis includes revenue trends, product performance, category insights, and customer segments. 

Technologies used:
- **Python (Pandas, NumPy, SQLAlchemy)**
- **SQL**
- **Jupyter Notebook**

---

## 🔄 ETL Process

### 1. **Extract**
Data is read from a cleaned CSV file and validated using Python (Pandas).

### 2. **Transform**
Unnecessary columns are dropped, missing values are handled, and data is formatted for SQL compatibility.

### 3. **Load**
Transformed data is loaded into an SQLite database, where queries are used for insight generation.

---

## 🧮 SQL Queries and Outputs

> ℹ️ *Below are the queries used to analyze the dataset. Outputs are to be added as images or markdown tables.*

---

### 🔝 Top 10 Revenue-Generating Products

```sql
SELECT product_name, SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


🛍️ Most Popular Categories by Quantity Sold
sql
Copy
Edit
SELECT category, SUM(quantity) AS total_quantity
FROM df_orders
GROUP BY category
ORDER BY total_quantity DESC;

🌍 Revenue and Profit by Region
sql
Copy
Edit
SELECT region, SUM(sale_price) AS total_revenue, SUM(profit) AS total_profit
FROM df_orders
GROUP BY region;


📦 Profit Margin by Product
sql
Copy
Edit
SELECT product_name, ROUND(SUM(profit) / SUM(sale_price) * 100, 2) AS profit_margin_percent
FROM df_orders
GROUP BY product_name
ORDER BY profit_margin_percent DESC
LIMIT 10;


✅ Conclusion
This project highlights how data can be extracted, cleaned, and analyzed using Python and SQL for actionable business insights. It also showcases how simple queries can answer key business questions regarding product sales, profitability, and customer trends.

📂 Project Files
Retail_Orders_Data_Analysis_&_ETL.ipynb – Full ETL process in Python

df_orders_querying.sql – SQL queries for analysis
