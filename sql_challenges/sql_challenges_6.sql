/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 6

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
    - IN (NOT IN)
    - BETWEEN (AND)

--------------------------------------------------------------------------------

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with. */

USE publications;

-- 1) Stores in CA or OR
SELECT 
    stor_name, state
FROM
    stores
WHERE
    state IN ('CA' , 'OR');

-- 2) Titles of type psychology, mod_cook, trad_cook
SELECT 
    title
FROM
    titles
WHERE
    type IN ('psychology' , 'mod_cook', 'trad_cook');

-- 3) Authors NOT from Salt Lake City, Ann Arbor, Oakland
SELECT 
    *
FROM
    authors
WHERE
    city NOT IN ('Salt Lake City' , 'Ann Arbor', 'Oakland');

-- 4) Order numbers with qty between 25 and 45
SELECT 
    ord_num
FROM
    sales
WHERE
    qty BETWEEN 25 AND 45;

-- 5) Orders between 1993-03-11 and 1994-09-13
SELECT 
    *
FROM
    sales
WHERE
    ord_date BETWEEN '1993-03-11' AND '1994-09-13';

-- 6) Job descriptions with max_lvl between 150 and 200
SELECT 
    job_desc
FROM
    jobs
WHERE
    max_lvl BETWEEN 150 AND 200;

