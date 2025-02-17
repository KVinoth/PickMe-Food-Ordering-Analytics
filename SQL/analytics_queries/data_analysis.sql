#---Total Revenue from All Orders
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status LIKE 'paid';


#---Count of Orders_items by Each Customer
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COUNT(oi.item_id) total_orders
FROM orders o
	JOIN order_items oi ON o.order_id=oi.order_id
	JOIN customers c ON o.user_id=c.user_id
GROUP BY c.user_id
ORDER BY total_orders DESC;


#---Most Ordered Item
SELECT i.item_name,SUM(oi.quantity) AS total_quantity
FROM order_items oi
	JOIN items i ON i.item_id=oi.item_id
GROUP BY i.item_id
ORDER BY total_quantity DESC
LIMIT 5;


#---Least Ordered Item
SELECT i.item_name,SUM(oi.quantity) AS total_quantity
FROM order_items oi
	JOIN items i ON i.item_id=oi.item_id
GROUP BY oi.item_id
ORDER BY total_quantity
LIMIT 6;


#---Most Popular Category
SELECT c.category_name,SUM(oi.quantity) AS popularity_by_quantity
FROM order_items oi
	JOIN items i ON oi.item_id=i.item_id
	JOIN categories c ON c.category_id=i.category_id
GROUP BY c.category_id
ORDER BY popularity_by_quantity DESC
LIMIT 3;














