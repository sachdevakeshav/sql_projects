CREATE SCHEMA pizza_runner;
SET search_path = pizza_runner;
use pizza_runner
DROP TABLE IF EXISTS runners;
CREATE TABLE `pizza_runner`.`runners` (
  `runner_id` INTEGER,
  `registration_date` DATE
);
INSERT INTO `pizza_runner`.`runners`
  (`runner_id`, `registration_date`)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');


DROP TABLE IF EXISTS customer_orders;
CREATE TABLE `pizza_runner`.`customer_orders` (
  `order_id` INTEGER,
  `customer_id` INTEGER,
  `pizza_id` INTEGER,
  `exclusions` VARCHAR(4),
  `extras` VARCHAR(4),
  `order_time` TIMESTAMP
);

INSERT INTO `pizza_runner`.`customer_orders`
  (`order_id`, `customer_id`, `pizza_id`, `exclusions`, `extras`, `order_time`)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


DROP TABLE IF EXISTS runner_orders;
CREATE TABLE `pizza_runner`.`runner_orders` (
  `order_id` INTEGER,
  `runner_id` INTEGER,
  `pickup_time` VARCHAR(19),
  `distance` VARCHAR(7),
  `duration` VARCHAR(10),
  `cancellation` VARCHAR(23)
);

INSERT INTO `pizza_runner`.`runner_orders`
  (`order_id`, `runner_id`, `pickup_time`, `distance`, `duration`, `cancellation`)
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


DROP TABLE IF EXISTS pizza_names;
CREATE TABLE `pizza_runner`.`pizza_names` (
  `pizza_id` INTEGER,
  `pizza_name` TEXT
);
INSERT INTO `pizza_runner`.`pizza_names`
  (`pizza_id`, `pizza_name`)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE `pizza_runner`.`pizza_recipes` (
  `pizza_id` INTEGER,
  `toppings` TEXT
);
INSERT INTO `pizza_runner`.`pizza_recipes`
  (`pizza_id`, `toppings`)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


DROP TABLE IF EXISTS `pizza_runner`.`pizza_toppings`;
CREATE TABLE `pizza_runner`.`pizza_toppings` (
  `topping_id` INTEGER,
  `topping_name` TEXT
);
INSERT INTO `pizza_runner`.`pizza_toppings`
  (`topping_id`, `topping_name`)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
  
  
  use pizza_runner
  select * from customer_orders

create  temporary  table customer_order(
order_id int,
customer_id int,
pizza_id int , 
exclusions VARCHAR(4),
extras VARCHAR(4),
order_time TIMESTAMP)

drop temporary table customer_orders

insert into customer_order
select order_id,customer_id,pizza_id,
case
 when exclusions is null or exclusions like 'null'  then ' ' 
else exclusions 
end as exclusions ,
case 
when extras is null or extras like 'null' then ' ' 
else extras 
end as extras ,
order_time 
from customer_orders


select * from customer_order
drop temporary table if  exists
create temporary table runner_order(
order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);
drop temporary table runner_order


select * from runner_orders




insert into runner_order
select order_id,runner_id,
case 
when pickup_time is null or pickup_time like 'null' then ' ' 
else pickup_time
end as pickup_time ,
case when distance is null or  distance like'null' then ' ' 
     when distance like '%km' then  trim('km' from distance)
     else distance end as distance,
case
WHEN duration is null or duration like 'null' THEN ' ' 
    WHEN duration LIKE '%mins' THEN TRIM('mins' from duration) 
    WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)        
    WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)       
    ELSE duration END AS duration,
CASE 
    WHEN cancellation IS NULL or cancellation LIKE 'null' THEN ''
    ELSE cancellation END AS cancellation 
from runner_orders    
    
     
     select * from runner_order


select * from customer_order
select count(*) as pizza_order_count 
from customer_order


select count(distinct(order_id))
as unique_orders
from customer_order


SELECT runner_id, COUNT(order_id) AS successful_orders
FROM runner_order
WHERE distance != 0
GROUP BY runner_id;

select * from customer_order
select pizza_id,count(pizza_id) as pizza_type_delivered
from customer_order
group by pizza_id



SELECT p.pizza_name, COUNT(c.pizza_id) AS delivered_pizza_count
FROM customer_order AS c
JOIN runner_order AS r
 ON c.order_id = r.order_id
JOIN pizza_names AS p
 ON c.pizza_id = p.pizza_id
WHERE r.distance != 0
GROUP BY p.pizza_name;

select * from customer_order
select * from pizza_names 

SELECT c.customer_id, p.pizza_name, COUNT(p.pizza_name) AS order_count
FROM customer_order AS c
JOIN pizza_names AS p
 ON c.pizza_id= p.pizza_id
GROUP BY c.customer_id, p.pizza_name
ORDER BY c.customer_id;

select * from runner_order

select * from customer_order


WITH pizza_count_cte AS
(
 SELECT c.order_id, COUNT(c.pizza_id) AS pizza_per_order
 FROM customer_order AS c
 JOIN runner_order AS r
  ON c.order_id = r.order_id
 WHERE r.distance != 0
 GROUP BY c.order_id
)
SELECT MAX(pizza_per_order) AS pizza_count
FROM pizza_count_cte;




