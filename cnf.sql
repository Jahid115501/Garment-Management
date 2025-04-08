-- Create Category table
CREATE TABLE IF NOT EXISTS Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100),
    category_description TEXT
);

-- Create Product table
CREATE TABLE IF NOT EXISTS Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create Shipping table
CREATE TABLE IF NOT EXISTS Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_address TEXT,
    shipping_date DATE,
    delivery_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Order_Details(order_id)
);

-- Inserting Categories
INSERT INTO Category (category_name, category_description) VALUES
('Electronics', 'Devices like phones, laptops, accessories, gadgets'),
('Fashion & Lifestyle', 'Shoes, clothes, sunglasses, handbags, etc.'),
('Home & Kitchen', 'Appliances, blenders, mixers, cookers'),
('Personal Care', 'Beauty and grooming products'),
('Books & Literature', 'Fiction and non-fiction books'),
('Fitness & Sports', 'Smartwatches, yoga mats, fitness trackers'),
('Toys & Games', 'Board games, Lego, dolls, and kids’ entertainment');

-- Inserting Customers
INSERT INTO Customer (first_name, last_name, email, phone) VALUES
('Raju', 'Rahman', 'raju.rahman@email.com', '123456789'),
('Sara', 'Hossain', 'sara.hossain@email.com', '198765432'),
('Ahsan', 'Kabir', 'ahsan.kabir@email.com', '176543210'),
('Mim', 'Islam', 'mim.islam@email.com', '165432109'),
('Hasan', 'Ali', 'hasan.ali@email.com', '189234567'),
('Tania', 'Sultana', 'tanya.sultana@email.com', '156789234'),
('Sohel', 'Mia', 'sohel.mia@email.com', '171234567'),
('Mousumi', 'Khan', 'mousumi.khan@email.com', '193456789'),
('Raihan', 'Ahmed', 'raihan.ahmed@email.com', '162345678'),
('Parvez', 'Rahman', 'parvez.rahman@email.com', '178765432'),
('Sifat', 'Rahman', 'sifat.rahman@email.com', '182345678'),
('Sujon', 'Sarker', 'sujon.sarker@email.com', '161234567'),
('Mehedi', 'Hasan', 'mehedi.hasan@email.com', '179876543'),
('Rina', 'Begum', 'rina.begum@email.com', '181234567'),
('Mahfuj', 'Alam', 'mahfuj.alam@email.com', '192345678'),
('Nusrat', 'Jahan', 'nusrat.jahan@email.com', '176543210'),
('Touhid', 'Siddique', 'touhid.siddique@email.com', '198765432'),
('Rahul', 'Khan', 'rahul.khan@email.com', '182345678'),
('Shamim', 'Ahmed', 'shamim.ahmed@email.com', '171234567'),
('Farhana', 'Rahman', 'farhana.rahman@email.com', '193456789');

-- Inserting Products 
INSERT INTO Product (product_name, category_id, price, stock_quantity, description) VALUES
('Samsung Galaxy S21', 1, 799.99, 50, 'Latest Samsung smartphone with 5G and amazing camera'),
('Apple iPhone 13', 1, 999.99, 30, 'New iPhone with high performance and iOS features'),
('Sony 65" 4K Ultra HD TV', 1, 599.99, 20, 'Smart TV with 4K resolution and Netflix support'),
('Nike Air Max 2021', 2, 120.00, 100, 'Comfortable sneakers for running and everyday wear'),
('Adidas Ultraboost', 2, 180.00, 80, 'High-performance running shoes with boost technology'),
('Levi''s Men Jeans', 2, 50.00, 150, 'Stylish and comfortable jeans for men'),
('Philips 5000 Series Razor', 4, 45.00, 60, 'Electric razor with close shave for smooth skin'),
('KitchenAid Stand Mixer', 3, 249.99, 25, 'Powerful stand mixer for baking and cooking'),
('Samsung Refrigerator', 3, 899.99, 15, 'Smart refrigerator with touch screen and Wi-Fi'),
('Dyson V11 Vacuum Cleaner', 3, 699.99, 30, 'Cordless vacuum with powerful suction'),
('Loreal Paris Shampoo', 4, 10.00, 200, 'Shampoo for shiny and smooth hair'),
('Maybelline New York Lipstick', 4, 15.00, 250, 'Long-lasting lipstick with multiple shades'),
('Dove Body Wash', 4, 8.00, 180, 'Nourishing body wash with mild ingredients'),
('The Alchemist by Paulo Coelho', 5, 12.99, 150, 'Inspirational novel by Paulo Coelho'),
('The Catcher in the Rye', 5, 9.99, 120, 'Classic American novel by J.D. Salinger'),
('Harry Potter Box Set', 5, 79.99, 100, 'Complete Harry Potter series in box set'),
('Call of Duty: Warzone', 7, 50.00, 200, 'Popular first-person shooter video game'),
('Adidas Yoga Mat', 6, 30.00, 100, 'Non-slip mat for yoga and exercise'),
('Garmin Fenix 6X Pro', 6, 599.99, 50, 'Premium GPS smartwatch for outdoor activities'),
('Monopoly Board Game', 7, 25.00, 80, 'Classic family board game with real estate strategy');

-- Temporarily disable foreign key checks to insert orders and shipping together
SET FOREIGN_KEY_CHECKS = 0;

-- Inserting Order Details and Shipping Information in a transaction
START TRANSACTION;

-- Order 1
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (1, 3, '2023-01-15', 1, 599.99, 599.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '123 Main St, Dhaka', '2023-01-16', '2023-01-20', 'Delivered');

-- Order 2
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (2, 5, '2023-01-16', 2, 180.00, 360.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '456 Park Ave, Chittagong', '2023-01-17', '2023-01-22', 'Delivered');

-- Order 3
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (3, 8, '2023-01-17', 1, 249.99, 249.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '789 Market Rd, Sylhet', '2023-01-18', '2023-01-23', 'Delivered');

-- Order 4
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (4, 12, '2023-01-18', 3, 15.00, 45.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '101 Hill St, Khulna', '2023-01-19', '2023-01-24', 'Delivered');

-- Order 5
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (5, 15, '2023-01-19', 1, 79.99, 79.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '202 River View, Rajshahi', '2023-01-20', '2023-01-25', 'Delivered');

-- Order 6
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (6, 18, '2023-01-20', 1, 599.99, 599.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '303 Garden Lane, Barisal', '2023-01-21', '2023-01-26', 'Delivered');

-- Order 7
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (7, 2, '2023-01-21', 1, 999.99, 999.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '404 Lake Side, Rangpur', '2023-01-22', '2023-01-27', 'Delivered');

-- Order 8
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (8, 4, '2023-01-22', 1, 120.00, 120.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '505 Mountain View, Mymensingh', '2023-01-23', '2023-01-28', 'Delivered');

-- Order 9
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (9, 6, '2023-01-23', 2, 50.00, 100.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '606 Ocean Drive, Comilla', '2023-01-24', '2023-01-29', 'Delivered');

-- Order 10
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (10, 9, '2023-01-24', 1, 899.99, 899.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '707 Sunset Blvd, Narayanganj', '2023-01-25', '2023-01-30', 'Delivered');

-- Order 11
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (11, 11, '2023-01-25', 2, 10.00, 20.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '808 Sunrise Ave, Gazipur', '2023-01-26', '2023-01-31', 'Delivered');

-- Order 12
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (12, 13, '2023-01-26', 5, 8.00, 40.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '909 Green Park, Bogura', '2023-01-27', '2023-02-01', 'Delivered');

-- Order 13
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (13, 16, '2023-01-27', 1, 50.00, 50.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '111 Blue Hill, Jessore', '2023-01-28', '2023-02-02', 'Delivered');

-- Order 14
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (14, 17, '2023-01-28', 1, 30.00, 30.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '222 Red Lane, Cox''s Bazar', '2023-01-29', '2023-02-03', 'Delivered');

-- Order 15
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (15, 19, '2023-01-29', 1, 599.99, 599.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '333 Yellow St, Dinajpur', '2023-01-30', '2023-02-04', 'Delivered');

-- Order 16
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (16, 20, '2023-01-30', 2, 25.00, 50.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '444 Purple Rd, Tangail', '2023-01-31', '2023-02-05', 'Delivered');

-- Order 17
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (17, 1, '2023-01-31', 1, 799.99, 799.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '555 Orange Ave, Pabna', '2023-02-01', '2023-02-06', 'Delivered');

-- Order 18
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (18, 7, '2023-02-01', 1, 45.00, 45.00);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '666 Silver St, Kushtia', '2023-02-02', '2023-02-07', 'Delivered');

-- Order 19
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (19, 10, '2023-02-02', 1, 699.99, 699.99);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '777 Gold Lane, Noakhali', '2023-02-03', '2023-02-08', 'Delivered');

-- Order 20
INSERT INTO Order_Details (customer_id, product_id, order_date, quantity, price, total_price) 
VALUES (20, 14, '2023-02-03', 3, 12.99, 38.97);
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (LAST_INSERT_ID(), '888 Diamond Rd, Faridpur', '2023-02-04', '2023-02-09', 'Delivered');

COMMIT;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
