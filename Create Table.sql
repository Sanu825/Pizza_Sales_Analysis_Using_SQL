CREATE DATABASE pizzahut;

-- Use database 
USE pizzahut;

-- Show all table





-- CREATE TABLE ORDERS
CREATE TABLE orders(
order_id INT NOT NULL PRIMARY KEY,
order_date DATE NOT NULL,
order_time TIME NOT NULL
);


-- CREATE TABLE ORDER_TYPES
CREATE TABLE order_details (
order_details_id INT NOT NULL,
order_id INT NOT NULL,
pizza_id TEXT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (order_details_id) );



-- SELECT DATA FROM THE TABLE
SELECT * FROM pizzas;


