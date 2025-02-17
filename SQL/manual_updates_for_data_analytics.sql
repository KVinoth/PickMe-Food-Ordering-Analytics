#---Customers Table
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES
('Nimal', 'Perera', '0712345678', 'nimal.perera@example.com'),
('Samantha', 'Fernando', '0723456789', 'samantha.fernando@example.com'),
('Lakshmi', 'Rathnayake', '0734567890', 'lakshmi.rathnayake@example.com'),
('Amara', 'Wijesinghe', '0745678901', 'amara.wijesinghe@example.com'),
('Kasun', 'Rajapaksa', '0756789012', 'kasun.rajapaksa@example.com'),
('Dilani', 'Jayawardene', '0767890123', 'dilani.jaya@example.com'),
('Chathura', 'Bandara', '0778901234', 'chathura.b@example.com'),
('Pradeep', 'Silva', '0789012345', 'pradeep.silva@example.com'),
('Ruwan', 'Ekanayake', '0790123456', 'ruwan.eka@example.com'),
('Harsha', 'Gunathilaka', '0711112233', 'harsha.g@example.com'),
('vinoth','Kumaravel','0712742551','kvino9699@gmail.com');

#---Categories Table
INSERT INTO categories (category_name) VALUES
('Beverages'),
('Desserts'),
('Snacks'),
('Main Course'),
('Fast Food'),
('Traditional Meals');

#---Items Table
INSERT INTO items (item_name, price, category_id) VALUES
('Sri Lankan Tea', 150.00, 1),
('Watalappan', 200.00, 2),
('Fish Bun', 100.00, 3),
('Rice and Curry', 500.00, 4),
('Kottu Roti', 600.00, 4),
('Falooda', 250.00, 2),
('Iced Coffee', 180.00, 1),
('Chocolate Biscuit Pudding', 300.00, 2),
('Veg Roll', 120.00, 3),
('Hoppers with Lunu Miris', 350.00, 6),
('Chicken Burger', 550.00, 5),
('Egg Roti', 200.00, 4),
('String Hoppers with Coconut Sambol', 400.00, 6),
('Pol Sambol Sandwich', 180.00, 3),
('Milk Rice with Jaggery', 350.00, 6);

#---Orders Table 
INSERT INTO orders (user_id, item_id, quantity, delivery_address) VALUES
(1, 1, 2, 'No. 123, Galle Road, Colombo'),
(2, 4, 1, 'No. 456, Colombo 3'),
(3, 5, 3, 'No. 789, Dehiwala, Colombo'),
(4, 3, 5, 'No. 101, Nugegoda, Colombo'),
(5, 10, 2, 'No. 222, Wellawatte, Colombo'),
(6, 7, 1, 'No. 555, Battaramulla, Colombo'),
(7, 12, 4, 'No. 777, Kotte, Colombo'),
(8, 8, 2, 'No. 888, Rajagiriya, Colombo'),
(9, 11, 3, 'No. 999, Pelawatte, Colombo'),
(10, 14, 1, 'No. 1001, Borella, Colombo');


#---Order Items Table 
INSERT INTO order_items (order_id, item_id, quantity, price) VALUES
(1, 1, 2, 150.00),
(1, 7, 1, 180.00),
(2, 4, 1, 500.00),
(3, 5, 3, 600.00),
(3, 6, 2, 250.00),
(4, 3, 5, 100.00),
(5, 10, 2, 350.00),
(5, 9, 1, 120.00),
(6, 8, 2, 300.00),
(6, 15, 1, 350.00),
(7, 12, 4, 200.00),
(8, 11, 3, 550.00),
(9, 14, 1, 180.00),
(9, 13, 2, 400.00),
(10, 2, 1, 200.00),
(10, 9, 3, 120.00),
(11, 5, 1, 600.00),
(12, 5, 1, 600.00);


#---Payments Table
INSERT INTO payments (order_id, payment_method, payment_status, amount) VALUES
(1, 'Credit Card', 'Paid', 480.00),
(2, 'Cash on Delivery', 'Pending', 500.00),
(3, 'GPay', 'Paid', 2300.00),
(4, 'Debit Card', 'Paid', 500.00),
(5, 'Credit Card', 'Paid', 820.00),
(6, 'Cash on Delivery', 'Pending', 650.00),
(7, 'GPay', 'Failed', 800.00),
(8, 'Debit Card', 'Paid', 1100.00),
(9, 'GPay', 'Paid', 950.00),
(10, 'Credit Card', 'Paid', 560.00),
(11, 'Credit Card', 'Paid', 560.00);



