-- View the menu_items table
 
select * from menu_items;

-- write a query to find the number of items on the menu

select count(*) as number_of_item from menu_items;

--  What are the least and most expensive items on the menu ?

select item_name , price from menu_items
order by price asc;

select item_name , price from menu_items
order by price desc;

-- How many Italian dishes are on the menu? 

select count(*) from menu_items
where category = "Italian";

-- What are the least and most expensive Italian dishes on the menu?

select * from menu_items
where category = "Italian"
order by price ;

select * from menu_items
where category = "Italian"
order by price desc ;

-- How many dishes are in each category

select category, count(menu_item_id) from menu_items
group by category;

-- What is the average dish price within each category?

select  avg(price),category
from menu_items
group by category ;

-- View the order_details table

select * from order_details;

--  What is the date range of the table?

select min(order_date), max(order_date) from order_details;

-- How many orders were made within this date range?

select count(distinct order_id) from order_details;

-- How many items were ordered within this date range?

select count(*) from order_details;

-- Which orders had the most number of items?

select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

-- How many orders had more than 12 items?

select Count(*) from 

(select order_id, count(item_id) as num_items
from order_details
group by order_id
having num_items > 12) as num_orders;

-- Combine the menu_items and order_details tables into a single table

select *
from order_details as od
left join menu_items as m on od.item_id = m.menu_item_id;

-- What were the least and most ordered items? What categories were they in?

select item_name,category, count(order_details_id) as num_purcahses
from order_details as od
left join menu_items as m on od.item_id = m.menu_item_id
group by item_name,category
order by num_purcahses desc;

-- What were the top 5 orders that spent the most money ?

SELECT order_id, SUM(price) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5 ;

-- View the details of the highest spent order. What insights can you gather from them ?

SELECT *
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440 ;

-- View the details of top 5 highest spent orders. What insights can you gather from them ?

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675 )
GROUP BY order_id, category;

