----- Create TABLE----
Create table grocary(
transactions_id int primary key,
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


-- Data Cleaning
SELECT * FROM retail_sales
WHERE transactions_id IS NULL

SELECT * FROM retail_sales
WHERE sale_date IS NULL

SELECT * FROM retail_sales
WHERE sale_time IS NULL

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- 
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales



SELECT DISTINCT category FROM retail_sales

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05.
    Select * from retail_sales
	where sale_date =  '2022-11-05';
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
     Select * from retail_sales
	where category = 'Clothing'
	 and quantity >= 3
	 and sale_date between '2022-11-01' and '2022-11-30';
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
      Select sum(total_sale) as total sale ,category from retail_sales
	  group by category;
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
    Select Round(avg(age),2) as average_age from retail_sales
	where category = 'Beauty';
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
    Select * from retail_sales
	 WHERE total_sale > 1000;
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
    select count(transactions_id), gender,category from retail_sales
	group by gender,category
	order by 3;
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
     Select extract(year from sale_date),
	 extract(month from sale_date),
	 avg(total_sale) as average_sale from retail_sales
	 group by 1,2
	 order by 1,2;
 
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.
    Select customer_id,sum(total_sale) from retail_sales
	group by 1
	order by 2 desc
	limit 5;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
       Select  count(distinct(customer_id)),category from retail_sales
	   group by 2;
   
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

    Select case when extract(hour from sale_time) <= 12 then 'Morning' 
	 when Extract(hour from sale_time) between 12 and 17 then 'Afternoon'
	else 'Evening' 
	 end as Shift,
	 count(*) as total_orders from retail_sales
	 group by shift;
---end project--