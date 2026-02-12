/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 7

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
    - GROUP BY
    - HAVING
------------------------------------------------------------------------------------------------

*/

USE publications;

-- 1) Total authors for each state
SELECT 
    state, COUNT(*) AS author_count
FROM
    authors
GROUP BY state;

-- 2) Same, ordered descending by author_count
SELECT 
    state, COUNT(*) AS author_count
FROM
    authors
GROUP BY state
ORDER BY author_count DESC;

-- 3) Most expensive title price from each publisher (by pub_id)
SELECT 
    pub_id, MAX(price) AS max_price
FROM
    titles
GROUP BY pub_id;

-- 4) Top 3 stores with the most sales (total qty)
SELECT 
    stor_id, SUM(qty) AS total_qty_sold
FROM
    sales
GROUP BY stor_id
ORDER BY total_qty_sold DESC
LIMIT 3;

-- 5) Average job level per job_id, ordered ascending
SELECT 
    job_id, AVG(job_lvl) AS avg_job_level
FROM
    employee
GROUP BY job_id
ORDER BY avg_job_level ASC;

-- 6) For each type, how many books each publisher has
SELECT 
    pub_id, type, COUNT(*) AS book_count
FROM
    titles
GROUP BY pub_id , type;

-- 7) Add average price for each publisher-type combination
SELECT 
    pub_id,
    type,
    COUNT(*) AS book_count,
    AVG(price) AS avg_price
FROM
    titles
GROUP BY pub_id , type;

-- 8) Keep only combos with avg price > 12
SELECT 
    pub_id,
    type,
    COUNT(*) AS book_count,
    AVG(price) AS avg_price
FROM
    titles
GROUP BY pub_id , type
HAVING AVG(price) > 12;

-- 9) Order by book_count desc, avg_price desc
SELECT 
    pub_id,
    type,
    COUNT(*) AS book_count,
    AVG(price) AS avg_price
FROM
    titles
GROUP BY pub_id , type
HAVING AVG(price) > 12
ORDER BY book_count DESC , avg_price DESC;

-- 10) States + cities where there are 2+ contracts overall
SELECT 
    state, city, SUM(contract) AS total_contracts
FROM
    authors
GROUP BY state , city
HAVING SUM(contract) >= 2;
