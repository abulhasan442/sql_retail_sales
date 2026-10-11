----- Create TABLE----
Create table retail_sales(
transaction_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(10),
age int,
category varchar(15),
quantity int,
price_per_unit decimal(10,2),
cogs float,
total_sale decimal(10,2));


Select * from retail_sales;

Select count(*) from retail_sales;

-- DATA CLEANING 

SELECT * FROM retail_sales
WHERE transaction_id IS NULL
or
sale_date IS NULL
OR
sale_time IS NULL
OR 
customer_id IS NULL
OR 
gender IS NULL
OR 
age IS NULL
OR 
category IS NULL
OR 
quantity IS NULL
OR 
price_per_unit IS NULL
OR 
cogs IS NULL
OR 
total_sale IS NULL;

-- DELETE DEMO

DELETE FROM retail_sales
WHERE 
transaction_id IS NULL
or
sale_date IS NULL
OR
sale_time IS NULL
OR 
customer_id IS NULL
OR 
gender IS NULL
OR 
age IS NULL
OR 
category IS NULL
OR 
quantity IS NULL
OR 
price_per_unit IS NULL
OR 
cogs IS NULL
OR 
total_sale IS NULL;

-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales;

-- How many unqiue customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;


-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * 
from retail_sales 
where category = 'Clothing' 
and 
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
and quantity >=4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select sum(total_sale) as net_sales , category , count(*) from retail_sales group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select round(avg(age),2) from retail_sales where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select count(transaction_id), gender,category from retail_sales
group by gender, category
order by category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select year, month, avg_sale from (
select 
	extract (year from sale_date) as year,
	extract (month from sale_date) as month,
	avg(total_sale) as avg_sale,
	rank() over(partition by extract (year from sale_date) order by avg(total_sale) desc) as rank
from retail_sales
group by 1,2) as t1
where rank = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id, sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category, count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale
as
(
select *,
	case
		when extract(hour from sale_time) < 12 then 'Morning'
		when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end as shift
from retail_sales
)
select shift, count(*) as total_orders from hourly_sale
group by shift;


-- End of Project
