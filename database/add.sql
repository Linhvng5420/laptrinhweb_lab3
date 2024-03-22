--Users Table:
INSERT INTO Users (user_name, user_email, user_pass, updated_at, created_at) VALUES
('John Doe', 'john.doe@gmail.com', 'password123', NOW(), NOW()),
('Jane Smith', 'jane.smith@gmail.com', 'password123', NOW(), NOW()),
('Alice Johnson', 'alice.johnson@gmail.com', 'password123', NOW(), NOW()),
('Bob Brown', 'bob.brown@gmail.com', 'password123', NOW(), NOW()),
('Charlie Davis', 'charlie.davis@gmail.com', 'password123', NOW(), NOW()),
('Diana Evans', 'diana.evans@gmail.com', 'password123', NOW(), NOW()),
('Frank Green', 'frank.green@gmail.com', 'password123', NOW(), NOW()),
('Grace Hall', 'grace.hall@gmail.com', 'password123', NOW(), NOW()),
('Henry Adams', 'henry.adams@gmail.com', 'password123', NOW(), NOW()),
('Isla Clark', 'isla.clark@gmail.com', 'password123', NOW(), NOW());

--Products Table:
INSERT INTO Products (product_name, product_description, price, stock_quantity, updated_at, created_at) VALUES
('Laptop', 'High-performance laptop', 999.99, 50, NOW(), NOW()),
('Smartphone', 'Latest model smartphone', 699.99, 100, NOW(), NOW()),
('Headphones', 'Noise-cancelling headphones', 199.99, 75, NOW(), NOW()),
('Smartwatch', 'Waterproof smartwatch', 299.99, 60, NOW(), NOW()),
('Tablet', '10-inch screen tablet', 399.99, 80, NOW(), NOW()),
('Camera', 'DSLR camera', 499.99, 40, NOW(), NOW()),
('Printer', 'All-in-one printer', 149.99, 30, NOW(), NOW()),
('Monitor', '4K UHD monitor', 349.99, 45, NOW(), NOW()),
('Keyboard', 'Mechanical keyboard', 99.99, 90, NOW(), NOW()),
('Mouse', 'Wireless mouse', 49.99, 150, NOW(), NOW());

--Orders Table:
INSERT INTO orders (user_id, updated_at, created_at) VALUES
(1, NOW(), NOW()),
(2, NOW(), NOW()),
(3, NOW(), NOW()),
(4, NOW(), NOW()),
(5, NOW(), NOW()),
(6, NOW(), NOW()),
(7, NOW(), NOW()),
(8, NOW(), NOW()),
(9, NOW(), NOW()),
(10, NOW(), NOW());

--Order_Details Table:
INSERT INTO order_details (order_id, product_id, updated_at, created_at) VALUES
(1, 1, NOW(), NOW()),
(1, 2, NOW(), NOW()),
(2, 3, NOW(), NOW()),
(2, 4, NOW(), NOW()),
(3, 5, NOW(), NOW()),
(3, 6, NOW(), NOW()),
(4, 7, NOW(), NOW()),
(4, 8, NOW(), NOW()),
(5, 9, NOW(), NOW()),
(5, 10, NOW(), NOW());