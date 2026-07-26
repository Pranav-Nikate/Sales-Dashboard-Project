SELECT * FROM ecommerce_dataset;

-- show all records 
select * from ecommerce_dataset;

-- show only customer_name and order_date
select customer_name , 
order_date from ecommerce_dataset;

-- find all order placed in june 2026
select * from ecommerce_dataset 
where order_date 
between '2026-06-01' and '2026-06-30';

-- show all orders where quantity > 2
select * from ecommerce_dataset 
where quantity > 2;

-- find all product with a price greater than 1000
select * from ecommerce_dataset 
where Unit_price > 1000;

-- count the total number of order
select count(*) from ecommerce_dataset;

-- find the total revenue
select sum(quantity * Unit_Price ) as total_revenue from ecommerce_dataset;

-- show unique customer name
select distinct customer_name from ecommerce_dataset;

-- show unique category
 select distinct category from ecommerce_dataset;
 
 -- show unique payment mode
 select distinct Payment_Method from ecommerce_dataset;
 
-- find the highest priced products
select * from ecommerce_dataset order by Unit_Price desc limit 1;

-- find the lowets priced products
select * from ecommerce_dataset 
order by Unit_Price asc 
limit 1;

-- calculate the avg product price
select product , avg(Unit_price) from ecommerce_dataset 
group by product;

-- find total sales for each customers
select customer_name , sum(sales) 
as total_sales from ecommerce_dataset 
group by Customer_Name;

-- find total sales for each city
select city , sum(sales) as total_sales 
from ecommerce_dataset 
group by city;

-- count the number of orders for each catergory
select category , count(*) as number_of_order 
from ecommerce_dataset 
group by category;

-- count the number of orders for each catergory
select Payment_Method , count(*) as number_of_order 
from ecommerce_dataset 
group by Payment_Method;

-- count the number of orders for each customers
select customer_name , count(*) as number_of_order 
from ecommerce_dataset 
group by Customer_Name;

-- find the top 5 customers by total spending
select customer_name , sum(sales) as total_spending 
from ecommerce_dataset 
group by Customer_Name 
order by total_spending desc 
limit 5; 

-- find the total sales of each month
select monthname(order_date) as month , sum(sales) as total_sales 
from ecommerce_dataset
group by month(order_date) , monthname(order_date) 
order by month(order_date) desc;

-- find total revenue by category 
select category , sum(sales) as total_revenue
from ecommerce_dataset
group by category
order by total_revenue desc;

-- find total revenue by payment method
select payment_method , sum(sales) as total_revenue
from ecommerce_dataset
group by payment_method
order by total_revenue desc;

-- find the 5 best selling products
select product as best_selling_product , sum(quantity) as total_sold 
from ecommerce_dataset 
group by best_selling_product 
order by total_sold desc 
limit 5 ;

-- find customers who placed more than 5 orders
select customer_name , count(*) as order_placed 
from ecommerce_dataset
group by customer_name 
having order_placed > 5 
order by order_placed desc;
 
-- find highest order amount 
select unit_price as highest_order_amount 
from ecommerce_dataset 
order by Unit_Price desc 
limit 1;

-- sort customers by total spending (hoghest to lowest)
select customer_name , sum(sales) as total_spending 
from ecommerce_dataset 
group by customer_name 
order by total_spending desc;

-- rank customers by total spending using
select customer_name , sum(sales) as total_spending , 
rank() over (order by sum(sales) desc) as customer_rank 
from ecommerce_dataset
group by customer_name 
order by total_spending desc;
 
-- find the 2nd highest order amonut
select  unit_price as 2nd_highest_order_amount 
from ecommerce_dataset 
order by Unit_Price desc 
limit 1 offset 1;

-- find each customer first order date
select customer_name , min(order_date) as first_order 
from ecommerce_dataset 
group by Customer_Name;

-- calculate a running total sales
select order_date, sum(sales) as daily_sales , 
sum(sum(sales)) 
over (order by order_date) as runnig_total 
from ecommerce_dataset
group by order_date 
order by order_date;
 
-- find the percentage contributation of each product to total revenue
select product , sum(sales) as product_revenue , round(
sum(sales) * 100/ 
sum(sum(sales))
over(),
       2
) as revenue_persentage 
from ecommerce_dataset
group by product
order by  revenue_persentage desc;