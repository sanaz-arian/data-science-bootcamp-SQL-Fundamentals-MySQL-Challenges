/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 2

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
	- WHERE
	- AND / OR / NOT

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

SELECT 
    au_fname, au_lname
FROM
    authors
WHERE
    au_lname = 'Ringer';

-- 2) Order number + order date where exactly 20 books were sold
SELECT 
    ord_num, ord_date
FROM
    sales
WHERE
    qty = 20;

-- 3) Authors with last name "Ringer" and first name "Anne"
SELECT 
    au_fname, au_lname
FROM
    authors
WHERE
    au_lname = 'Ringer'
        AND au_fname = 'Anne';

-- 4) Publishers based in Germany or France
SELECT 
    pub_name, city
FROM
    publishers
WHERE
    country IN ('Germany' , 'France');

-- 5) Authors: first name "Dean" and city Oakland or Berkeley
SELECT 
    au_fname, au_lname, city
FROM
    authors
WHERE
    au_fname = 'Dean'
        AND city IN ('Oakland' , 'Berkeley');

-- 6) Publishers not based in the USA
SELECT 
    pub_name, city, country
FROM
    publishers
WHERE
    country <> 'USA';

-- 7) Authors in Oakland or Berkeley, and last name NOT "Straight"
SELECT 
    au_fname, au_lname, city
FROM
    authors
WHERE
    city IN ('Oakland' , 'Berkeley')
        AND au_lname <> 'Straight';
