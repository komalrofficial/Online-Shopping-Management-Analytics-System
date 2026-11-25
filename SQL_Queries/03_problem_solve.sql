### quesstions
use online_shopping;

-- 1. Display all products with category names
select p.product_name,c.category_name
from products p
left join categories c
on p.category_id=c.category_id;

-- 2. Find products costing more than ₹1000
select product_id ,product_name,price
from products
where price > 1000;

-- 3. Show customers from Nagpur
select customer_id,customer_name,city
from customers
where city="nagpur";

-- 4. Total Orders by Customer
select
      c.customer_id,
      c.customer_name,
      count(o.order_id)as total_orders
from customers c
join orders o
     on c.customer_id=o.customer_id
     group by
     c.customer_id,
     c.customer_name
	order by total_orders desc;


-- 5. Total Sales by Product
select product_id,sum(quantity) as total_sales
from orderdetails
group by product_id
order by total_sales desc;

-- 6. Top Selling Product
select product_id, sum(quantity) as total_quantity_sold
from orderdetails
group by product_id
order by total_quantity_sold desc
limit 1;


-- 7. Customer who spent maximum amount
#orderdetails -- quantity
#product-- price
#customer-- customer_nameorderdetails

select c.customer_name,sum(od.quantity * p.price)as total_spend
from customers c join
orders o
on c.customer_id = o.customer_id
join orderdetails od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id
group by c.customer_name
order by total_spend desc
limit 1;

-- 8. Find products priced above average price.
select product_id,product_name,price
from products
where price > (select avg(price)
from products);


-- 9. Find customers having more orders than average.
#(join + subquerry)

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS customer_orders
);



-- 10. get customer orders using stored procedure 

delimiter //
create procedure getcustomerorders (in p_customer_id int)
begin
     select * from orders
     where customer_id = p.customer_id;
     end //
delimiter ;

CALL GetCustomerOrders(1);


 


-- 11. reduce stock order using trigger

DELIMITER //

CREATE TRIGGER reduce_stock
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;
 
 INSERT INTO orderdetails
    (order_detail_id, order_id, product_id, quantity)
VALUES
    (1, 1001,101, 2);

-- 12. rank product by sales

SELECT
    product_name,
    revenue,
    rank()over(order by revenue desc)as product_rank
from
( select
      p.product_name,
      sum(od.quantity*p.price)as revenue
 from products p
 join orderdetails od
           on p.product_id=od.product_id
           group by p.product_name
)as productsales;

 
-- 13. monthly sales
SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(p.price * od.quantity) AS monthly_sales
FROM orders o
JOIN orderdetails od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    sales_year,
    sales_month;


-- 14. city wise customer
select city,count(customer_id) as total_customer
from customers
group by city order by total_customer desc;

-- 15. category wise revenue

SELECT
    c.category_name,
    SUM(p.price * od.quantity) AS revenue
FROM products p
JOIN orderdetails od
    ON p.product_id = od.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name;


-- 16. product never ordered 
SELECT 
    p.product_id, p.product_name
FROM
    products p
        JOIN
    orderdetails od ON p.product_id = od.product_id
WHERE
    od.order_id IS NULL;

select * from orderdetails;

-- 17. total revenue of company

select sum(p.price* od.quantity) as total_revenue
from products p
join orderdetails od
  on p.product_id=od.product_id


select avg(price)from products;
