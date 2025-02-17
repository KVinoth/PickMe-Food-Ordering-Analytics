#---Find the Top 3 Highest Paying Customers
SELECT c.user_id,c.first_name,c.last_name,SUM(p.amount) AS total_amount
FROM orders o
	JOIN customers c ON o.user_id=c.user_id
	JOIN payments p ON o.order_id=p.order_id
WHERE p.payment_status='Paid'
GROUP BY c.user_id
ORDER BY total_amount DESC
LIMIT 3;

#---Get the Running Total of Payments Over Time
SELECT payment_id,amount,paid_at,
SUM(amount) OVER (ORDER BY payment_id) AS running_total
FROM payments
WHERE payment_status='Paid';


#---Rank Customers by Number of Orders
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COUNT(o.order_id)AS total_orders,
RANK() OVER(ORDER BY COUNT(o.order_id) DESC) AS order_rank
FROM customers c
JOIN orders o ON c.user_id=o.user_id
GROUP BY o.user_id;


#---Find Customers Who Ordered More Than One Item in a Single Order
SELECT c.first_name,c.last_name,
COUNT(oi.order_item_id) AS order_items_count
FROM customers c 
	JOIN orders o ON c.user_id=o.user_id
	JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY(oi.order_id)
HAVING COUNT(oi.order_item_id) >1;


#---Regex & String Handling
#---Find Customers with Emails from a Specific Domain (e.g., Gmail)
SELECT c.first_name,c.last_name
FROM customers c 
WHERE email REGEXP '@gmail\\.com$';


#---Real-Time Scenarios & Business Insights
#---Find Orders Delivered to a Specific Area (e.g., Colombo 3)
SELECT c.*,
	o.order_id,o.item_id,o.quantity,o.delivery_address,o.order_date
FROM customers c 
	LEFT JOIN orders o 	ON c.user_id=o.user_id
WHERE o.delivery_address LIKE '%Dehiwala%';


#---Find Average Order Value per Customer
WITH avarage_order_value AS
(
	SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name,
	SUM(price) AS summation_order_value,
    COUNT(o.order_id) AS total_orders
	FROM customers c	
		JOIN orders o ON c.user_id=o.user_id
		JOIN order_items oi ON o.order_id=oi.order_id
	GROUP BY c.user_id
    ORDER BY summation_order_value DESC
)
SELECT customer_name,
summation_order_value/NULLIF(total_orders,0) AS avarage_order_value
FROM avarage_order_value 
;



#---Identify Customers Who Have Never Placed an Order

#--- ADD new user
INSERT INTO `pick_me`.`customers`
(`user_id`,`first_name`,`last_name`,`phone_number`,`email`)
VALUES
(12,'Vimensha','Vinoth','0741236155','Vimensha@gmail.com');


SELECT c.user_id,c.first_name,c.last_name
FROM customers c
	LEFT JOIN orders o ON c.user_id=o.user_id
WHERE o.order_id IS NULL;


#---Find the Average Time Between Order and Payment
SELECT o.order_id, AVG(TIMESTAMPDIFF(MINUTE,o.order_date,p.paid_at)) AS average_time_to_payments_minutes
FROM orders o
LEFT JOIN payments p ON o.order_id=p.order_id
GROUP BY o.order_id;




