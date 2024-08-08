-- 1. List all transactions
SELECT * FROM transactions;

-- 2. List all transactions, columns to be selected is:
-- transactions.id, products.name, categories.name 
-- name of the product’s category 
SELECT transactions.id, 
    products.name as product_name, 
    categories.name as categories
FROM transactions
INNER JOIN products ON transactions.id=products.id
INNER JOIN categories ON transactions.id=categories.id;

-- 3. List only 10 transactions, start from record no 21
SELECT id, product_name
FROM `transactions`
LIMIT 10 offset 20;

-- 4. List transaction only for Radio
SELECT *
FROM `transactions`
where product_name = 'Radio';

-- Or
SELECT *
FROM `transactions`
where product_name LIKE '%Radio%';

-- 5. List transaction only for Radio between 2024-01-01 - 2024-02-15
SELECT *
FROM `transactions`
where product_name LIKE '%Radio%' and
created_at between '2024-01-01' and '2024-02-15';

-- Or
SELECT *
FROM `transactions`
where product_name LIKE '%Radio%' and
month(created_at) = 2;

-- 6. List transaction from Microwave in Feb 2024
SELECT *
FROM `transactions`
where product_name LIKE '%Microwave%' and
month(created_at) = 2 and year(created_at) = 2024;

-- 7. Sum transaction from Microwave in Feb 2024
SELECT SUM(total) as total_price 
from transactions
where product_name LIKE '%Microwave%' and
created_at between '2024-02-01' and '2024-02-28';

--Or
SELECT SUM(total) 
    as total_price 
from transactions
where product_name LIKE '%Microwave%' and
month(created_at) = 2;

-- 8. List transaction from TV only in 2024
SELECT * 
FROM transactions 
where product_name LIKE '%TV%'
and year(created_at) = 2024;

-- 9. Count number of transactions that TV has for each year
SELECT year(created_at) 
    AS years, count(product_id)  
    AS count_product
FROM transactions
where product_name LIKE '%TV%'
GROUP BY years;

-- 10. Sum the qty from all transactions for each products 
SELECT DISTINCT product_name,
    sum(qty) AS sum_product
FROM transactions 
GROUP BY product_name;

-- 11 Find avg total for all transactions
select AVG(total) as average from transactions;

-- 11.1 Find avg total for each product
select DISTINCT product_name, AVG(total) as average 
from transactions GROUP BY product_name;