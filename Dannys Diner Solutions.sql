
/* The below are the queries for solutions of all the questions of Danny's Diner case study 
about customer behaviour analysis.

Here Q5, Q10 and Bonus-Q2 are some interesting queries
*/


-- Q1. What is the total amount each customer spent at the restaurant?
select s.customer_id, sum(price) as total_spent
from sales s
join menu u on u.product_id = s.product_id
group by s.customer_id
order by s.customer_id; 


-- Q2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as total_visited_days
from sales 
group by customer_id
order by customer_id; 


-- Q3. What was the first item from the menu purchased by each customer?
select distinct customer_id, order_date, product_name from
(select *, rank() over(partition by customer_id order by order_date) as rnk from sales s
join menu u using(product_id)) x
where x.rnk = 1;


-- Q4. What is the most purchased item on the menu and how many times was it purchased by all customers?
with most_sold_item as
(select product_name, count(*) as total_purchased
from sales s
join menu u using(product_id)
group by product_name)
select * from most_sold_item
where total_purchased = (select max(total_purchased) from most_sold_item);


-- Q5. Which item was the most popular for each customer?
with most_popular_item as
(select s.customer_id, u.product_name, count(*) as times_ordered,
rank() over(partition by s.customer_id order by count(*) desc) as rnk
from sales s 
join menu u on s.product_id = u.product_id 
group by 1, 2)
select customer_id, product_name, times_ordered
from most_popular_item
where rnk = 1;


-- Q6. Which item was purchased first by the customer after they became a member?
with member_first_item as
(select m.customer_id, u.product_name, order_date, rank() over(partition by m.customer_id order by s.order_date) as rnk
from sales s
join menu u using(product_id)
join members m on s.customer_id = m.customer_id and s.order_date >= m.join_date)
select customer_id, product_name from member_first_item
where rnk = 1;


-- Q7. Which item was purchased just before the customer became a member?
with last_item_before_membership as
(select m.customer_id, u.product_name, order_date, rank() over(partition by m.customer_id order by s.order_date desc) as rnk
from sales s
join menu u using(product_id)
join members m on s.customer_id = m.customer_id and s.order_date < m.join_date)
select customer_id, product_name from last_item_before_membership
where rnk = 1;



-- Q8.(original question) What is the total items and amount spent for each member before they became a member? 
-- 8.(modified question) On average how much amount a customer spent and ordered items before they became a member? 
select customer_id, avg(total_items) as avg_ordered_items, avg(total_amount_spent) avg_amount_spent
from
(select s.customer_id, count(*) as total_items, sum(u.price) as total_amount_spent
from sales s
join menu u on s.product_id = u.product_id
join members m on s.customer_id = m.customer_id and s.order_date < m.join_date
group by s.customer_id
order by s.customer_id) temp;



-- Q9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select s.customer_id, 
sum(case when product_name = 'sushi' then price * 10 * 2
else price * 10 end) as total_points
from sales s
join menu u on u.product_id = s.product_id 
group by customer_id;


/* Q10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, but sushi always get 2x points and not just in first_week - 
how many points do customer A and B have at the end of January?*/
select s.customer_id,
	sum(case when datediff(order_date, join_date) between 0 and 6 then price * 20
    when product_name = 'sushi' then price * 20 
    else price * 10 end) as total_points
-- you can also write as:
-- sum(case when order_date between join_date and join_date + 6 then price * 20 else price * 10 end) as total_points
from sales s
join menu u on s.product_id = u.product_id
join members m on s.customer_id = m.customer_id
where order_date <= '2021-01-31'
group by s.customer_id
order by s.customer_id;


--  Bonus Q1. Recreate the table output using the available data (check 8 week sql challenge website for table)
select s.customer_id, s.order_date, u.product_name, u.price,
case when join_date is not null and order_date >= join_date then 'Y' else 'N' end as member
from sales s
join menu u on s.product_id = u.product_id
left join members m on s.customer_id = m.customer_id
order by s.customer_id, order_date;


--  Bonus Q2. Recreate the table output using the available data and Rank all the things (check 8 week sql challenge website for table)
with customer_info as
(select s.customer_id, s.order_date, u.product_name, u.price,
case when join_date is not null and order_date >= join_date then 'Y' else 'N' end as member
from sales s
join menu u on s.product_id = u.product_id
left join members m on s.customer_id = m.customer_id
order by s.customer_id, order_date)
select *,  
case when member = 'N' then null 
else dense_rank() over(partition by s.customer_id, member order by s.order_date)
end as ranking
from customer_info
order by s.customer_id, s.order_date;





