#---Use Index to Speed Up Search by Customer Name
CREATE INDEX idx_customer_name ON customers(first_name,Last_name);

EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name = 'Nimal' AND last_name = 'Perera';


#--- Use Index to Optimize Orders by User ID
CREATE INDEX idx_orders_user_id ON orders(user_id);


#---Partitioning & Advanced Optimization
#---Partition Payments Table by Payment Status

ALTER TABLE payments 
DROP PRIMARY KEY,
ADD PRIMARY KEY (payment_id, payment_status);  


ALTER TABLE payments 
PARTITION BY LIST COLUMNS(payment_status) (
    PARTITION p_paid VALUES IN ('Paid'),
    PARTITION p_pending VALUES IN ('Pending'),
    PARTITION p_failed VALUES IN ('Failed')
);
