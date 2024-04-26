select * from pizzas;
select * from pizza_types;
select * from orders;
select * from order_details;


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

-- find the top 5 most ordered pizza along with their quantities
select
	pizza_types.name,
	sum(order_details.quantity) as quantity
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

-- determine the distribution of orders by the hour of the day
SELECT
	HOUR(time) as hour,
	COUNT(order_id) as order_count
from
	orders
group by
	HOUR(time);


-- join the relevant tables to find the category wise how many times 
-- specific category ordered
select
	category,
	count(order_id) as order_count
from
	pizzas
join pizza_types
on
	pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on
	pizzas.pizza_id = order_details.pizza_id
group by
	category
order by
	order_count desc;

-- determine category wise pizza types
select
	category,
	count(name) as pizza_types
from
	pizza_types
group by
	category;

-- group the orders by date and calculate the average numbers of pizzas
-- ordered per day
select
	avg(quantity)
from
	(
	select
		orders.date,
		sum(order_details.quantity) as quantity
	from
		order_details
	join orders
on
		order_details.order_id = orders.order_id
	group by
		orders.date) as order_quantity;


-- determine the top 3 most ordered pizza based on their revenue
select
	pizza_types.name ,
	ROUND(SUM(order_details.quantity * pizzas.price), 0) 
as revenue
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
	revenue desc
limit 3;







