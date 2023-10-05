select * from gold_user_signup
select * from product
select * from sales
select * from users
-- total amount each customer spent on zomato

select s.user_id,sum(price) as total_spent
from sales s join product p on p.product_id=s.product_id
group by s.user_id;

-- how many times each customer visited zomato
select USER_ID,count(created_date) as customer_days_zomato 
from sales
group by user_id;

-- first product purchased by each customer
select distinct USER_ID,product_id,rnk from

(select *,(rank() over (partition by user_id order by created_date)) rnk
from sales) a
where rnk=1

-- most purchased item by each customer


select product_id from 
(select top 1 product_id,count(created_date) count_product_id
from sales
group by product_id 
order by count_product_id desc) c

-- how many times each customer purchased most buying product
select user_id,count(product_id) as count_most_buying_product  from sales
where product_id=2
group by user_id;

-- favorite product of each customer
select * from
(select *,rank() over(partition by user_id order by count_of_products desc) as rnk from
(select USER_ID,product_id,count(product_id) as count_of_products
from sales
group by user_id,product_id) d) e
where rnk=1



