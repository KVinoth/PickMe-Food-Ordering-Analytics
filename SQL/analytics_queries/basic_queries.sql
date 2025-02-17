#--- Retrieve All Customers
SELECT * 
FROM customers;


#---Retrieve All Orders
SELECT * 
FROM orders;


#---List All Items in the Menu with Prices
SELECT items.item_name,items.price
FROM items;


#---Find Orders Placed by a Specific Customer (e.g., 'Vinoth')
SELECT  o.order_id,
		CONCAT(c.first_name,' ',c.last_name) customer_name,
		c.phone_number,
		o.delivery_address,
		i.item_name,
        oi.price
FROM orders o
JOIN customers c ON o.user_id=c.user_id
JOIN items i ON o.item_id=i.item_id
JOIN order_items oi ON o.order_id=oi.order_id
WHERE c.first_name = 'Vinoth';

SELECT  o.order_id,
		CONCAT(c.first_name,' ',c.last_name) customer_name,
		c.phone_number,
		o.delivery_address,
		i.item_name,
        SUM(oi.price) OVER() AS total_price 
FROM orders o
JOIN customers c ON o.user_id=c.user_id
JOIN items i ON o.item_id=i.item_id
JOIN order_items oi ON o.order_id=oi.order_id
WHERE c.first_name = 'Nimal'
LIMIT 1;


#---Retrieve Pending Payments

SELECT * 
FROM payments
WHERE payment_status='Pending';


#---Find Customers Who Ordered a Specific Item (e.g., 'Kottu Roti')
SELECT DISTINCT CONCAT(c.first_name,' ' ,c.last_name) AS  customer_name 
FROM customers c
	JOIN orders o ON c.user_id=o.user_id
	JOIN order_items oi ON o.item_id=oi.item_id
	JOIN items i ON o.item_id=i.item_id
WHERE item_name = 'kottu Roti';

