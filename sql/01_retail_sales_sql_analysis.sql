
-- DATABASE NAME: retail_sales_sql_analysis


-- Creating  TABLE  retail_sales


DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sales FLOAT
            );

SELECT * FROM retail_sales ;

--  Data Loaded From CSV File

SELECT * FROM retail_sales ;

SELECT COUNT(*) FROM retail_sales ;

/*========================================
      DATA CLEANING
========================================*/


SELECT * FROM retail_sales
WHERE transaction_id IS NULL ;

SELECT * FROM retail_sales
WHERE sale_date IS NULL ;

SELECT * FROM retail_sales
WHERE sale_time IS NULL ;

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
    total_sales IS NULL;



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
    total_sales IS NULL;

/* =========================
       DATA EXPLORATION
   =========================  */	   

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales  ;

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales  ;

-- How many unique categories we have , show them 


SELECT COUNT(DISTINCT category) FROM retail_sales ;  -- total number of categories .

SELECT DISTINCT category FROM retail_sales ;  -- distinct categories .



/*========================================
      BUSINESS QUESTIONS & SOLUTIONS
========================================*/


 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

-- solution 1 
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity > 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';


-- solution 2 


SELECT * FROM retail_sales
WHERE category = 'Clothing' 
      AND quantity > 4
	  AND sale_date >= '2022-11-01'
	  AND sale_date < '2022-12-01'
	  ;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sales) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE LOWER(category) = 'beauty' ;


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.


SELECT * FROM retail_sales
WHERE total_sales > 1000 ;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

-- solution 1
SELECT 
     category , 
	 gender , 
	 COUNT(transaction_id) as total_transactions
	 
FROM retail_sales  
GROUP BY category , gender  
ORDER BY category ;


--  solution 2 
SELECT 
       category , 
	   gender , 
	   COUNT(*) as total_transactions  
FROM retail_sales  
GROUP BY category , gender 
ORDER BY category ;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

-- step 1 :- 

SELECT EXTRACT(YEAR FROM sale_date ) AS year , 
       EXTRACT(MONTH FROM sale_date) AS month , 
	   AVG(total_sales) AS avg_total_sale 
FROM retail_sales 
GROUP BY 1 ,2 
ORDER BY 1 ,3 DESC;

-- step 2:-

SELECT year , month , avg_total_sale
FROM
(
SELECT EXTRACT(YEAR FROM sale_date ) AS year , 
       EXTRACT(MONTH FROM sale_date) AS month , 
	   AVG(total_sales) AS avg_total_sale ,
	   RANK()  OVER (PARTITION BY EXTRACT (YEAR FROM sale_date) 
	   ORDER BY AVG(total_sales) DESC ) as rank
FROM retail_sales 
GROUP BY 1 ,2 
)AS t1 
WHERE rank = 1 ;
			
	   -- ORDER BY 1 ,3 DESC;


-- Final Solution  
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sales) AS avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sales) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1 ;
    


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales .

SELECT 
    customer_id,
    SUM(total_sales) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5  ;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,    
    COUNT(DISTINCT customer_id) as total_unique_customers
FROM retail_sales
GROUP BY category ;



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

-- solution 1 (simple query )

SELECT
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,

    COUNT(*) AS total_orders

FROM retail_sales

GROUP BY shift

ORDER BY shift;


-- solution 2  (CTE)

WITH shift_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)

SELECT 
    shift,
    COUNT(*) as total_orders    
FROM shift_sale
GROUP BY shift ;



-- Solution 3: (Subquery)

SELECT shift, 
       COUNT(*)
FROM
(
    SELECT *,
           CASE
               WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
               WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               ELSE 'Evening'
           END AS shift
    FROM retail_sales
) AS shift_sale
GROUP BY shift;



-- Q 11 .Find the category that generated more than 300000 total sales.


SELECT 
  category, 
  SUM(total_sales)  AS total_sales
FROM retail_sales
GROUP BY category
HAVING SUM(total_sales) > 300000;



-- Q.12 Write a SQL query to find the category with the highest total sales.

SELECT
    category,
    SUM(total_sales) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY SUM(total_sales) DESC
LIMIT 1;



-- Q.13 Write a SQL query to find the customer who spent the highest total amount in each category.


SELECT 
     customer_id ,
	 category ,
	 total_purchase 
FROM 
 (   SELECT 
         customer_id ,
		 category ,
		 SUM(total_sales) AS total_purchase ,

		 RANK() OVER
		 ( 
		     PARTITION BY category 
		     ORDER BY SUM(total_sales) DESC 
		 
		 ) AS rank 

		 FROM retail_sales 
	 GROUP BY  customer_id , category 
) AS temp1

WHERE rank = 1 ;


-- Q.14 Calculate total profit and profit margin percentage for each category.
SELECT 
    category,
    SUM(total_sales) as gross_sales,
    SUM(cogs) as total_cost,
    SUM(total_sales - cogs) as net_profit,
    ROUND((SUM(total_sales - cogs) / SUM(total_sales) * 100)::NUMERIC, 2) as profit_margin_pct
FROM retail_sales
GROUP BY category
ORDER BY net_profit DESC   ;
