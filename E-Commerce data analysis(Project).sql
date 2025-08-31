create database Ecommerce_sales;
USE Ecommerce_sales;
-- Sales & Profit by Category
Select Category, 
sum(Amount) as Total_sales ,
sum(Profit) as Total_profit
from order_details_raw
group by Category
order by Total_sales desc; 
-- Top 5 Cities by Sales
Select orders_raw.City,sum(order_details_raw.Amount) as City_sales 
from orders_raw 
join order_details_raw on orders_raw.`Order ID`=order_details_raw.`Order ID`
group by orders_raw.city
order by City_sales desc
limit 5; 
-- sales vs Targets
SELECT s.Category, 
       SUM(d.Amount) AS Actual_Sales, 
       s.Target,
       (SUM(d.Amount) - s.Target) AS Variance
FROM sales_target_raw s
JOIN order_details_raw d ON s.Category = d.Category
GROUP BY s.Category, s.Target;
 -- Most Profitable Sub Category
select `Sub-Category`,
sum(Profit) as total_profit
from order_details_raw
group by `Sub-Category`
order by total_profit desc 
limit 5;
-- Top 5 customers
SELECT CustomerName, 
       SUM(d.Amount) AS Total_Spent
FROM orders_raw o
JOIN order_details_raw d ON o.`Order ID` = d.`Order ID`
GROUP BY CustomerName
ORDER BY Total_Spent DESC
LIMIT 5;