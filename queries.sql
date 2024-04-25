select
	*
from
	pizzas;

select
	*
from
	pizza_types;

SELECT
	*
from
	orders;

select
	*
from
	order_details;


-- find total number of orders placed
select
	COUNT(orders.order_id) as total_orders
from
	orders;


-- calculate the total revenue generated from pizza sales
select
	round(sum(pizzas.price * order_details.quantity), 2) as total_sales
from
	pizzas
join order_details
on
	pizzas.pizza_id = order_details.pizza_id
	
	
-- identify the highest priced pizza
select
	*
FROM 
	pizzas
join pizza_types
on
	pizzas.pizza_type_id = pizza_types.pizza_type_id
order by
	pizzas.price desc
limit 1;


-- identify the most common pizza quantity ordered
select
	quantity,
	count(quantity)
from
	order_details
group by
	quantity;


-- identify the most common pizza size ordered
select
	size,
	count(order_details_id) as order_count
from
	pizzas
join order_details
on
	pizzas.pizza_id = order_details.pizza_id
group by
	pizzas.size
order by
	order_count desc;

-- 
select
	pizza_types.name,
	count(order_details.quantity) as quantity
from
	pizzas
join pizza_types
on
	pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on
	pizzas.pizza_id = order_details.pizza_id
group by
	pizza_types.name
order by
	quantity desc
limit 5;
