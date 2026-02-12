/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 4

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses/operators:
	- SELECT FROM
    - AS
	- DISTINCT
	- WHERE
	- AND / OR / NOT
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with. */


USE publications;

-- 1) How many different states are authors from?
SELECT 
    COUNT(DISTINCT state) AS num_states
FROM
    authors;

-- 2) How many publishers are based in the USA?
SELECT 
    COUNT(*) AS usa_publishers
FROM
    publishers
WHERE
    country = 'USA';

-- 3) Average quantity sold per sale by store 7131
SELECT 
    AVG(qty) AS avg_qty_store_7131
FROM
    sales
WHERE
    stor_id = '7131';

-- 4) When was the employee with the highest level hired?
SELECT 
    hire_date
FROM
    employee
WHERE
    job_lvl = (SELECT 
            MAX(job_lvl)
        FROM
            employee);

-- 5) Average price of psychology books
SELECT 
    AVG(price) AS avg_psychology_price
FROM
    titles
WHERE
    type = 'psychology';

-- 6) Which has more ytd_sales: business or popular_comp?
SELECT 
    SUM(ytd_sales) AS business_ytd_sales
FROM
    titles
WHERE
    type = 'business';

SELECT 
    SUM(ytd_sales) AS popular_comp_ytd_sales
FROM
    titles
WHERE
    type = 'popular_comp';

-- 7) Title + price of the most expensive book
SELECT 
    title, price
FROM
    titles
ORDER BY price DESC
LIMIT 1;

-- 8) Price of the most expensive psychology book
SELECT 
    MAX(price) AS max_psychology_price
FROM
    titles
WHERE
    type = 'psychology';

-- 9) How many authors live in San Jose or Salt Lake City
SELECT 
    COUNT(*) AS authors_in_two_cities
FROM
    authors
WHERE
    city IN ('San Jose' , 'Salt Lake City');
