DROP TABLE order_details;
DROP TABLE orders;
DROP TABLE products;
DROP TABLE categories;
DROP TABLE employees;
DROP TABLE customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    dob DATE,
    email VARCHAR(255),
    gender VARCHAR(10),
    country VARCHAR(50),
    region VARCHAR(50),
    city VARCHAR(50),
    asset INT,
    marital_status VARCHAR(20)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    experience INT,
   	salary DECIMAL(10, 2)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE products (
    productid INT PRIMARY KEY,
    productname VARCHAR(255),
    categoryid INT,
    price DECIMAL(10, 2),
    CONSTRAINT fk_category FOREIGN KEY (categoryid) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    customer_id INT,
    quantity_sold INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(productid),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances');

-- Insert data into products
INSERT INTO products (productid, productname, categoryid, price) VALUES
(1, 'Laptop', 1, 1200.00),
(2, 'Smartphone', 1, 800.00),
(3, 'TV', 1, 600.00),
(4, 'T-shirt', 2, 20.00),
(5, 'Jeans', 2, 50.00),
(6, 'Microwave', 3, 100.00),
(7, 'Refrigerator', 3, 1500.00),
(8, 'Washing Machine', 3, 700.00),
(9, 'Jacket', 2, 120.00),
(10, 'Headphones', 1, 150.00);

-- Insert data into customers
INSERT INTO customers (customer_id, name, dob, email, gender, country, region, city, asset, marital_status) VALUES
(1, 'Alice Johnson', '1987-03-15', 'alice.johnson@example.com', 'Female', 'USA', 'California', 'Los Angeles', 75000, 'Single'),
(2, 'Bob Williams', '1980-11-23', 'bob.williams@example.com', 'Male', 'Canada', 'Ontario', 'Toronto', 62000, 'Married'),
(3, 'Catherine Davis', '1992-07-09', 'catherine.davis@example.com', 'Female', 'UK', 'London', 'London', 68000, 'Single'),
(4, 'David Harris', '1985-12-01', 'david.harris@example.com', 'Male', 'Australia', 'New South Wales', 'Sydney', 82000, 'Married'),
(5, 'Eva Martinez', '1990-04-10', 'eva.martinez@example.com', 'Female', 'USA', 'Texas', 'Houston', 70000, 'Single'),
(6, 'Frank Thompson', '1983-05-05', 'frank.thompson@example.com', 'Male', 'Canada', 'British Columbia', 'Vancouver', 90000, 'Married'),
(7, 'Grace Lee', '1991-09-14', 'grace.lee@example.com', 'Female', 'USA', 'New York', 'New York City', 60000, 'Single'),
(8, 'Henry Clark', '1978-02-20', 'henry.clark@example.com', 'Male', 'UK', 'Manchester', 'Manchester', 82000, 'Married'),
(9, 'Isabella Young', '1988-08-30', 'isabella.young@example.com', 'Female', 'Australia', 'Victoria', 'Melbourne', 71000, 'Single'),
(10, 'James Walker', '1982-11-12', 'james.walker@example.com', 'Male', 'USA', 'Florida', 'Miami', 93000, 'Married'),
(11, 'Katherine Hill', '1994-01-25', 'katherine.hill@example.com', 'Female', 'Canada', 'Quebec', 'Montreal', 65000, 'Single'),
(12, 'Liam Baker', '1979-06-08', 'liam.baker@example.com', 'Male', 'UK', 'Scotland', 'Edinburgh', 88000, 'Married'),
(13, 'Mia Carter', '1986-12-19', 'mia.carter@example.com', 'Female', 'Australia', 'Queensland', 'Brisbane', 72000, 'Married'),
(14, 'Noah Scott', '1984-04-15', 'noah.scott@example.com', 'Male', 'USA', 'California', 'San Francisco', 76000, 'Single'),
(15, 'Olivia Green', '1991-07-22', 'olivia.green@example.com', 'Female', 'Canada', 'Ontario', 'Ottawa', 59000, 'Single'),
(16, 'Paul Adams', '1983-03-03', 'paul.adams@example.com', 'Male', 'UK', 'Wales', 'Cardiff', 87000, 'Married'),
(17, 'Quinn Nelson', '1995-10-13', 'quinn.nelson@example.com', 'Female', 'Australia', 'South Australia', 'Adelaide', 78000, 'Single'),
(18, 'Ryan Cooper', '1980-09-07', 'ryan.cooper@example.com', 'Male', 'USA', 'Nevada', 'Las Vegas', 84000, 'Married'),
(19, 'Sophia King', '1987-02-17', 'sophia.king@example.com', 'Female', 'Canada', 'Alberta', 'Calgary', 65000, 'Single'),
(20, 'Thomas Wright', '1989-11-11', 'thomas.wright@example.com', 'Male', 'UK', 'England', 'Birmingham', 91000, 'Married');

-- Insert data into employees
INSERT INTO employees (employee_id, employee_name, experience, salary) VALUES
(1, 'Alice', 5, 75000.00),
(2, 'Bob', 8, 85000.00),
(3, 'Charlie', 3, 60000.00),
(4, 'David', 10, 95000.00),
(5, 'Eve', 7, 80000.00),
(6, 'Frank', 12, 105000.00);


-- Insert 50 records into the orders table
INSERT INTO orders (order_id, order_date, employee_id) VALUES
(1, '2024-01-01', 1),
(2, '2024-01-02', 2),
(3, '2024-01-03', 3),
(4, '2024-01-04', 4),
(5, '2024-01-05', 5),
(6, '2024-01-06', 1),
(7, '2024-01-07', 2),
(8, '2024-01-08', 3),
(9, '2024-01-09', 4),
(10, '2024-01-10', 5),
(11, '2024-01-11', 1),
(12, '2024-01-12', 2),
(13, '2024-01-13', 3),
(14, '2024-01-14', 4),
(15, '2024-01-15', 5),
(16, '2024-01-16', 1),
(17, '2024-01-17', 2),
(18, '2024-01-18', 3),
(19, '2024-01-19', 4),
(20, '2024-01-20', 5),
(21, '2024-01-21', 1),
(22, '2024-01-22', 2),
(23, '2024-01-23', 3),
(24, '2024-01-24', 4),
(25, '2024-01-25', 5),
(26, '2024-01-26', 1),
(27, '2024-01-27', 1),
(28, '2024-01-28', 1),
(29, '2024-01-29', 2),
(30, '2024-01-30', 3),
(31, '2024-02-01', 4),
(32, '2024-02-02', 2),
(33, '2024-02-03', 3),
(34, '2024-02-04', 4),
(35, '2024-02-05', 5),
(36, '2024-02-06', 1),
(37, '2024-02-07', 1),
(38, '2024-02-08', 1),
(39, '2024-02-09', 2),
(40, '2024-02-10', 1),
(41, '2024-02-11', 1),
(42, '2024-02-12', 2),
(43, '2024-02-13', 3),
(44, '2024-02-14', 4),
(45, '2024-02-15', 5),
(46, '2024-02-16', 2),
(47, '2024-02-17', 2),
(48, '2024-02-18', 2),
(49, '2024-02-19', 1),
(50, '2024-02-20', 2);


-- Insert 100 records into the order_details table
INSERT INTO order_details (order_detail_id, order_id, product_id, customer_id, quantity_sold) VALUES
(1, 1, 1, 1, 2),
(2, 1, 2, 2, 1),
(3, 2, 3, 3, 4),
(4, 2, 4, 4, 2),
(5, 3, 5, 1, 3),
(6, 3, 6, 2, 1),
(7, 4, 7, 3, 5),
(8, 4, 8, 4, 2),
(9, 5, 9, 2, 3),
(10, 5, 10, 3, 4),
(11, 6, 1, 4, 2),
(12, 6, 2, 2, 1),
(13, 7, 3, 4, 5),
(14, 7, 4, 3, 2),
(15, 8, 5, 3, 3),
(16, 8, 6, 3, 1),
(17, 9, 7, 3, 4),
(18, 9, 8, 3, 2),
(19, 10, 9, 3, 3),
(20, 10, 10, 2, 5),
(21, 11, 1, 3, 2),
(22, 11, 2, 2, 4),
(23, 12, 3, 1, 3),
(24, 12, 4, 2, 5),
(25, 13, 5, 2, 1),
(26, 13, 6, 2, 2),
(27, 14, 7, 2, 4),
(28, 14, 8, 3, 3),
(29, 15, 9, 2, 2),
(30, 15, 10, 2, 1),
(31, 16, 1, 2, 5),
(32, 16, 2, 2, 3),
(33, 17, 3, 2, 4),
(34, 17, 4, 2, 2),
(35, 18, 5, 2, 1),
(36, 18, 6, 2, 4),
(37, 19, 7, 2, 2),
(38, 19, 8, 3, 5),
(39, 20, 9, 4, 3),
(40, 20, 10, 4, 1),
(41, 21, 1, 4, 4),
(42, 21, 2, 4, 2),
(43, 22, 3, 4, 5),
(44, 22, 4, 4, 3),
(45, 23, 5, 4, 1),
(46, 23, 6, 4, 2),
(47, 24, 7, 4, 4),
(48, 24, 8, 4, 3),
(49, 25, 9, 4, 5),
(50, 25, 10, 4, 1),
(51, 26, 1, 1, 2),
(52, 26, 2, 2, 1),
(53, 27, 3, 3, 4),
(54, 27, 4, 4, 2),
(55, 28, 5, 6, 3),
(56, 28, 6, 7, 1),
(57, 29, 7, 8, 5),
(58, 29, 8, 9, 2),
(59, 30, 9, 8, 3),
(60, 30, 10, 7, 4),
(61, 31, 1, 6, 2),
(62, 31, 2, 5, 1),
(63, 32, 3, 4, 5),
(64, 32, 4, 3, 2),
(65, 33, 5, 2, 3),
(66, 33, 6, 2, 1),
(67, 34, 7, 1, 4),
(68, 34, 8, 3, 2),
(69, 35, 9, 3, 3),
(70, 35, 10, 3, 5),
(71, 36, 1, 5, 2),
(72, 36, 2, 6, 4),
(73, 37, 3, 7, 3),
(74, 37, 4, 8, 5),
(75, 38, 5, 9, 1),
(76, 38, 6, 8, 2),
(77, 39, 7, 7, 4),
(78, 39, 8, 3, 3),
(79, 40, 9, 6, 2),
(80, 40, 10, 5, 1),
(81, 41, 1, 1, 5),
(82, 41, 2, 4, 3),
(83, 42, 3, 9, 4),
(84, 42, 4, 3, 2),
(85, 43, 5, 2, 1),
(86, 43, 6, 9, 4),
(87, 44, 7, 1, 2),
(88, 44, 8, 8, 5),
(89, 45, 9, 7, 3),
(90, 45, 10, 6, 1),
(91, 46, 1, 5, 4),
(92, 46, 2, 4, 2),
(93, 47, 3, 3, 5),
(94, 47, 4, 2, 3),
(95, 48, 5, 9, 1),
(96, 48, 6, 8, 2),
(97, 49, 7, 7, 4),
(98, 49, 8, 6, 3),
(99, 50, 9, 5, 5),
(100, 50, 10, 4, 1);


