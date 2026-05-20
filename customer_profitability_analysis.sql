CREATE DATABASE ecommerce;
use ecommerce
show tables

select * from retail

-- 1.Which customer segments contribute the highest sales and revenue?
select segment,
round(sum(sales),2) as revenue
from retail
group by segment
order by revenue desc

-- The Consumer segment contributes the highest revenue, generating more sales than the 
-- Corporate and Home Office segments. This shows that individual customers are the main 
-- source of business revenue

2.Which customer segments generate the highest profit?
select segment,
round(sum(profit),2) as profits
from retail
group by segment
order by profits desc

-- The Consumer segment generates the highest profit compared to other customer segments 

-- 3.What is the average sales contribution for different customer segments?
select segment,
round(avg(sales),2) as avg_sales
from retail
group by segment

-- 4.Which customer segments purchase most frequently?
select segment,
count(*) as Most_frequently_purchased
from retail
group by segment
order by Most_frequently_purchased desc
limit 1

-- Customers from the Consumer segment purchase products more frequently than other 
-- segments

-- 5.Which customer segment is most sensitive to discounts?
select segment,
round(avg(discount),2) as avg_discount,
round(sum(profit),2) as profit
from retail
where discount>0
group by segment
order by profit asc

-- 6.Which category drives the overall business growth the most?
select category,
round(sum(sales),2) as revenue
from retail 
group by category
order by revenue desc

-- Technology products generate the highest sales revenue among all categories

-- 7.Which products have high sales but low profit?
select sub_category,
round(sum(sales),2) as sales,
round(sum(profit),2) as profits
from retail
group by sub_category
order by sales desc,profits asc

-- Tables, Machines, Bookcases, and Supplies generate good sales but bring very little 
-- profit or even losses for the business

-- 8.Which sub-categories are highly profitable and which are least profitable?
with profit_table as (
	select sub_category,sum(profit) as pro
	from retail
	group by sub_category
	),
    
high_pro as (
	select sub_category,
    row_number() over() as rn
    from profit_table
    where pro>
    (select avg(pro) from profit_table)
	),
    
low_pro as (
	select sub_category,
    row_number() over() as rn
    from profit_table
    where pro<
    (select avg(pro) from profit_table)
    )

select h.sub_category as High_profitable,
l.sub_category as Low_profitable
from high_pro h
join low_pro l
on h.rn=l.rn

-- 9.Which products have the highest sales frequency?
select sub_category,
count(*) as sold
from retail
group by sub_category 
order by sold desc

-- Products like Binders and Paper are purchased more frequently compared to Furnishings,
-- Phones, and Storage products

-- 10.Which categories are most affected by heavy discounts?
select sub_category,
round(sum(profit),2) as loss
from retail
where discount>0.5
group by sub_category
order by loss asc

-- Binders experience the highest losses when heavy discounts are applied

-- 11.Are higher quantities sold actually leading to higher profits?
select sub_category,
sum(quantity) as quantities_sold,
round(sum(profit),2) as profits
from retail
group by sub_category
order by profits desc

-- Higher quantities sold do not always lead to higher profits. Some products with lower
--  sales quantity still generate higher profits

-- 12.Which products should the business discontinue due to repeated losses?
select sub_category,
count(*) as loss_count,
round(sum(profit),2) as loss
from retail
where profit<0
group by sub_category
order by loss_count desc

-- Binders generate repeated losses, even though they also contribute high sales revenue

-- 13.Which states contribute the highest revenue and profit?
select state,
round(sum(sales),2) as revenue
from retail
group by state
order by revenue desc
limit 5

select state,
round(sum(profit),2) as profits
from retail
group by state
order by profits desc
limit 5

-- States like California and New York generate the highest sales revenue and profits

-- 14.Which regions have strong sales growth over time?
select 
year(order_date) as year, region,
round(sum(sales),2) as sales
from retail
group by year(order_date),region
order by year,sales desc

select 
year(order_date) as year, region,
round(sum(profit),2) as profits
from retail
group by year(order_date),region
order by year,profits desc

-- he West region generates the highest sales and profits over time

-- 15.What are the monthly and yearly sales trends?
select year(order_date) as year,
monthname(order_date) as month,
round(sum(sales),2) as sales
from retail
group by year(order_date),
		month(order_date),
        monthname(order_date)
order by year,month(order_date) 

-- 16.Which months have peak sales and peak profits?
select year(order_date) as year,
monthname(order_date) as month,
round(sum(sales),2) as sales
from retail
group by year(order_date), month(order_date), monthname(order_date)
order by sales desc
limit 10

select year(order_date) as year,
monthname(order_date) as month,
round(sum(profit),2) as profits
from retail
group by year(order_date), month(order_date), monthname(order_date)
order by profits desc
limit 10

-- Sales are highest during the last few months of the year, especially in September, 
-- November, and December.

-- 17.Which ship modes are associated with higher profits?
select ship_mode,
round(sum(profit),2) as profits
from retail
group by ship_mode
order by profits desc

-- Standard Class shipping generates the highest profits, while Same Day delivery 
-- generates the lowest profits.

-- 18.What is the relationship between discount percentage and profitability?
select discount,
sum(profit) as profits
from retail
group by discount
order by discount

-- Higher discounts lead to lower profitability and increase business losses.




