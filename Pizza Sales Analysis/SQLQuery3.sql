Select * from pizza_sales

Select SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales 


Select SUM(quantity) as Total_Pizza_Sold from pizza_sales

Select COUNT(DISTINCT order_id) as Total_orders from pizza_sales

SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(count(distinct order_id) AS DECIMAL(10,2)) AS Avg_pizzas_Per_order from pizza_sales


SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id)
as Total_orders from pizza_sales
Group by DATENAME(DW, order_date)


SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
Order BY Total_orders Desc

SELECT pizza_category , sum(total_price) as Total_sales, sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS PCT
from pizza_sales 
WHERE MONTH(order_date) =1
GROUP BY pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, CAST(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales 
where datepart(QUARTER, order_date) =1 
group by pizza_size
order by PCT Desc



SELECT Top 5 pizza_name, SUM(total_price) as Total_Revenue FROM pizza_sales
group by pizza_name
order by Total_Revenue DESC



SELECT Top 5 pizza_name, SUM(total_price) as Total_Revenue FROM pizza_sales
group by pizza_name
order by Total_Revenue ASC


SELECT Top 5 pizza_name, SUM(quantity) as Total_Quantity FROM pizza_sales
group by pizza_name
order by Total_Quantity ASC



SELECT Top 5 pizza_name, COUNT (DISTINCT order_id) as Total_Orders FROM pizza_sales
group by pizza_name
order by Total_Orders 