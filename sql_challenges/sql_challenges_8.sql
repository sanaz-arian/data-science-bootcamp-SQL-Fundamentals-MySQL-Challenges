/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 8

*******************************************************************************
*******************************************************************************

In the exercises below you might need to use the any of the clauses learned so 
far.

*/

USE publications;

-- 1) Top 5 orders with most qty between two dates
SELECT 
    ord_num, ord_date, qty
FROM
    sales
WHERE
    ord_date BETWEEN '1993-03-11' AND '1994-09-13'
ORDER BY qty DESC
LIMIT 5;

-- 2) How many authors: "i" in first name AND state in UT/MD/KS
SELECT 
    COUNT(*) AS author_count
FROM
    authors
WHERE
    au_fname LIKE '%i%'
        AND state IN ('UT' , 'MD', 'KS');

-- 3) In CA: author count per city containing "o"
--    only cities with >1 author, sort ascending by author count
SELECT 
    city, COUNT(*) AS author_count
FROM
    authors
WHERE
    state = 'CA' AND city LIKE '%o%'
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY author_count ASC;
