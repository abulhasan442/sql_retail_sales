# Retail Sales Analysis (SQL Project)

A SQL project that cleans and analyzes a retail sales dataset to uncover customer behavior, category performance, and sales trends.

## 📌 Overview

This project demonstrates core SQL skills — table creation, data cleaning, and exploratory data analysis (EDA) — on a retail sales dataset. It covers everything from handling missing data to answering real business questions using aggregate functions, `GROUP BY`, `CASE` statements, and date/time functions.

## 🗃️ Dataset

The dataset (`retail_sales`) contains transaction-level retail sales records with the following fields:

| Column | Description |
|---|---|
| `transactions_id` | Unique transaction identifier (Primary Key) |
| `sale_date` | Date of sale |
| `sale_time` | Time of sale |
| `customer_id` | Unique customer identifier |
| `gender` | Customer gender |
| `age` | Customer age |
| `category` | Product category |
| `quantity` | Quantity sold |
| `price_per_unit` | Price per unit |
| `cogs` | Cost of goods sold |
| `total_sale` | Total sale amount |

## 🧹 Data Cleaning

- Checked for and removed records with `NULL` values in key columns (`transaction_id`, `sale_date`, `sale_time`, `gender`, `category`, `quantity`, `cogs`, `total_sale`)
- Verified row counts and unique customer/category counts before analysis

## 🔍 Data Exploration

- Total number of sales
- Total number of unique customers
- List of distinct product categories

## 📊 Business Questions Answered

1. Retrieve all sales made on `2022-11-05`
2. Find all 'Clothing' transactions with quantity > 4 in Nov-2022
3. Calculate total sales for each category
4. Find the average age of customers who purchased from the 'Beauty' category
5. Find all transactions where `total_sale` > 1000
6. Find total number of transactions by gender and category
7. Calculate average sale per month and identify the best-selling month each year
8. Find the top 5 customers by total sales
9. Find the number of unique customers per category
10. Categorize orders into shifts (Morning / Afternoon / Evening) based on sale time and count orders per shift

## 🛠️ Tools Used

- SQL (PostgreSQL syntax)

## 🚀 How to Use

1. Clone this repository
2. Run `Sql_project_01.sql` in your SQL environment (PostgreSQL recommended)
3. Execute queries section by section — Table Creation → Data Cleaning → Data Exploration → Analysis

> **Note:** The table is created as `grocary` in the script but queried as `retail_sales` throughout — rename the table (or update the `CREATE TABLE` statement) to `retail_sales` before running, and note that the cleaning queries use `transaction_id` while the table defines `transactions_id`, so align the column name as well.

## 📈 Key Learnings

- Writing clean, well-structured SQL queries for real-world business questions
- Data cleaning and validation using `NULL` checks
- Aggregate functions, `GROUP BY`, `CASE WHEN`, and date/time extraction
- Deriving actionable business insights from transactional data

## 👤 Author

Abul Hasan
