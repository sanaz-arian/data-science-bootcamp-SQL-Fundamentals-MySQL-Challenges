/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 10

*******************************************************************************
*******************************************************************************


In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - CASE
*/

/*******************************************************************************
CASE

https://www.w3schools.com/sql/sql_case.asp
*******************************************************************************/

USE publications;

-- 1) Add a sales category column to the sales table
SELECT 
    s.*,
    CASE
        WHEN s.qty >= 50 THEN 'high sales'
        WHEN s.qty >= 20 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category
FROM
    sales AS s;


-- 2) Total books sold in each sales category
SELECT 
    CASE
        WHEN qty >= 50 THEN 'high sales'
        WHEN qty >= 20 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category,
    SUM(qty) AS total_books_sold
FROM
    sales
GROUP BY sales_category;


-- 3) Only categories where total books sold > 100
SELECT 
    CASE
        WHEN qty >= 50 THEN 'high sales'
        WHEN qty >= 20 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category,
    SUM(qty) AS total_books_sold
FROM
    sales
GROUP BY sales_category
HAVING SUM(qty) > 100
ORDER BY total_books_sold DESC;


-- 4) Average book price per publisher and type,
--    grouped into price categories
SELECT 
    p.pub_name,
    t.type,
    CASE
        WHEN t.price <= 5 THEN 'super low'
        WHEN t.price <= 10 THEN 'low'
        WHEN t.price <= 15 THEN 'medium'
        ELSE 'high'
    END AS price_category,
    ROUND(AVG(t.price), 0) AS avg_price
FROM
    titles AS t
        JOIN
    publishers AS p ON t.pub_id = p.pub_id
WHERE
    t.type IN ('business' , 'trad_cook', 'psychology')
GROUP BY p.pub_name , t.type , price_category
ORDER BY p.pub_name , t.type , price_category;
