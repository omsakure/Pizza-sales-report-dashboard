SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sales FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order FROM pizza_sales;
	


-- Total order count per each day of week 
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- Total order count per month of year 
SELECT DATENAME(MONTH, order_date) AS Month_Order, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date),MONTH(order_date)
ORDER BY MONTH(order_date); 

-- Revenue percentage as per pizza categoty 
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS percentage 
FROM pizza_sales
GROUP BY pizza_category;

-- Revenue percentage as per pizza size
SELECT pizza_size, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS percentage 
FROM pizza_sales
GROUP BY pizza_size;

-- Top 5 pizza according to revenue 
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Bottom 5 pizza according to revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 pizza according to quantity selling
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC 

-- Bottom 5 pizza according to quantity selling
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
