-- 1. Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND((SUM(pizzas.price * order_details.quantity) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizzas.price),
                                0) AS total_Sales
                FROM
                    order_details
                        JOIN
                    pizzas ON pizzas.pizza_id = order_details.pizza_id)) * 100,
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;


-- 2. Analyze the cumulative revenue generated over time.

SELECT order_date, 
round(sum(revenue) OVER(ORDER BY order_date), 2) AS cum_revenue
FROM
(SELECT orders.order_date, 
sum(pizzas.price * order_details.quantity) AS revenue
FROM orders
JOIN order_details
ON order_details.order_id = orders.order_id
JOIN pizzas
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY orders.order_date) AS sales;


-- 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category, name, revenue
from 
(select category, name, revenue, 
rank() over(partition by category order by revenue desc) as ranking
from
(select pizza_types.category, pizza_types.name, round(sum(pizzas.price * order_details.quantity), 1) as revenue
from pizza_types
join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category,  pizza_types.name) as a) as b
where ranking <= 3;
