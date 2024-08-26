
-- Basic Problems

-- 1. Retrieve the total number of orders placed.
SELECT COUNT(order_id) as Total_Order FROM ORDERS;


-- 2. Calculate the total revenue generated from pizza sales.
SELECT
round(sum(order_details.quantity * pizzas.price), 0) as total_Sales
FROM
order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id ;


-- 3. Identify the highest-priced pizza.
SELECT pizza_types.name, pizzas.price
FROM 
pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;


-- 4. Identify the most common pizza size ordered.
SELECT pizzas.size, count(order_details.order_details_id) as count_order
FROM pizzas JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size ORDER BY count_order DESC;



-- 5. List the top 5 most ordered pizza types
-- Along with their quantities

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;


