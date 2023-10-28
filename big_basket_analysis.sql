select * from big_basket_products
limit 5
select `index` , `category` ,`sale_price`, `market_price` 
from big_basket_products


# top 5 products with most discount prices 

select product,rating,sale_price,market_price,(market_price - sale_price) as discount_amount
from big_basket_products 
where sale_price < market_price 
order by discount_amount desc
limit 5;


# total number of products with discount of 1 

select count(*) as total_products
from big_basket_products
where (market_price - sale_price)   = 1 


#total number of diffrent categories 

select count(distinct(category)) as total categories
from big_basket_products

#total number of categories in  the dataset 

select distinct(category),count(category)as total_categories
from big_basket_products
group by category


# analysis for which products are performing well and which should be removed

select * from big_basket_products
select product,rating
from big_basket_products 
where rating >=3

select count(*)
from big_basket_products
where rating >=3

select count(*) as total_products
from big_basket_products 


select count(*)
from big_basket_products
where rating <=3


select (market_price - sale_price) as discount_price 
from big_basket_products
where rating <= 3
order by discount_price


select (market_price - sale_price) as discount_price 
from big_basket_products
where rating <= 3
order by discount_price desc



select (market_price - sale_price) as discount_price 
from big_basket_products
where rating >= 3
order by discount_price desc

select  count(category), category
from big_basket_products 
where rating >= 3
group by category


select  count(rating),category,brand,rating
from big_basket_products 
where rating < 3
group by brand,category,rating
order by count(category) desc

select  count(rating),category,brand
from big_basket_products 
where rating >= 3
group by brand,category
order by count(category) desc

#products that should big basket remove as they are not performing well
select * from 
big_basket_products 
where brand in ('Fresho','3BO','INATUR ')
and rating <3
order by brand


 

