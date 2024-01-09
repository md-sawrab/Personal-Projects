1. View the menu_items table.
```SQL
SELECT *
FROM menu_items;
```

2. Find the number of items on the menu

```SQL
SELECT COUNT(*)
FROM menu_items;
```

3. What are the least and most expensive item on the menu ?

```SQL
SELECT *
FROM menu_items
ORDER BY price;
```

```SQL
SELECT *
FROM menu_items
ORDER BY price DESC;
```

4. How many italian dishes are on the menu ?

```SQL
SELECT COUNT(*)
FROM menu_items
WHERE category = 'italian';
```

5. What are the least and most expensive italian dishes on the menu ?

```SQL
SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price;
```

```SQL
SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price DESC;
```

6. How many dishes are in each category ?

```SQL
SELECT category, COUNT(*)
FROM menu_items
GROUP BY category;
```

7. What is the average dish price within each category ?

```SQL
SELECT category, AVG(price)
FROM menu_items
GROUP BY category;
```
---

1. View order_details table.

```SQL
SELECT *
FROM order_details;
```

2. What is the date range of the table ?

```SQL
SELECT MIN(order_date), max(order_date)
FROM order_details;
```

3. How many orders where made within this date range ?

```SQL
SELECT COUNT(DISTINCT order_id)
FROM order_details;
```
4. How many items where ordered within this date range ?

```SQL
SELECT COUNT(*)
FROM order_details;
```
5. Which orders had the most number of items ?

```SQL
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
```
6. How many orders had more than 12 items ?

```SQL
SELECT COUNT(*)
FROM (SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;
```
---

1. Combine the menu_items table and order_details table into a single table.

```SQL
SELECT * FROM menu_items;
SELECT * FROM order_details;
```
```SQL
SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;
```

2. What were the least and most ordered items ? What categories where they in ?

```SQL
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
```

3. What were the top 5 orders that spent the most money ?

```SQL
SELECT order_id, SUM(price) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5 ;
```

4. View the details of the highest spent order. What insights can you gather from them ?

```SQL
SELECT *
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440 ;
```

5. View the details of top 5 highest spent orders. What insights can you gather from them ?

```SQL
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675 )
GROUP BY order_id, category;
```

### Results / Findings

The analysis results are summarized as follows:
1. The most and least expensive item in the Restaurant is Shrim scrampi (Italian) & Edamame (Asian).
2. The most and least ordered items are American Hamburger & Mexican Chicken Tacos.

### References

Maven Analytics.
