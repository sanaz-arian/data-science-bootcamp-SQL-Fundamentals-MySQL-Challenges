/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 3

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses/operators:
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

-- 1) Title + ytd_sales ordered by ytd_sales (ascending)
SELECT 
    title, ytd_sales
FROM
    titles
ORDER BY ytd_sales;

-- 2) Same but descending
SELECT 
    title, ytd_sales
FROM
    titles
ORDER BY ytd_sales DESC;

-- 3) Top 5 titles with most ytd_sales
SELECT 
    title, ytd_sales
FROM
    titles
ORDER BY ytd_sales DESC
LIMIT 5;

-- 4) Maximum books sold in a single order (max qty)
SELECT 
    MAX(qty) AS max_qty_single_order
FROM
    sales;

-- 5) Price of the cheapest book
SELECT 
    MIN(price) AS cheapest_price
FROM
    titles;

-- 6) How many rows in authors table
SELECT 
    COUNT(*) AS author_rows
FROM
    authors;

-- 7) Total year-to-date sales
SELECT 
    SUM(ytd_sales) AS total_ytd_sales
FROM
    titles;

-- 8) Average price of books
SELECT 
    AVG(price) AS avg_book_price
FROM
    titles;

-- 9) Count, average, sum of quantity in sales
SELECT 
    COUNT(qty) AS cnt_qty_rows,
    AVG(qty) AS avg_qty,
    SUM(qty) AS sum_qty
FROM
    sales;
