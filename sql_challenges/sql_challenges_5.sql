/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 5

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
	- LIKE (%, _)

--------------------------------------------------------------------------------

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with. */

USE publications;

-- 1) Books that contain "cooking" in the title
SELECT 
    *
FROM
    titles
WHERE
    title LIKE '%cooking%';

-- 2) Titles that start with "The"
SELECT 
    *
FROM
    titles
WHERE
    title LIKE 'The%';

-- 3) Full names of authors whose last name starts with "S"
SELECT 
    CONCAT(au_fname, ' ', au_lname) AS full_name
FROM
    authors
WHERE
    au_lname LIKE 'S%';

-- 4) Stores located in an Avenue (address ends with "Ave.")
SELECT 
    stor_name, stor_address
FROM
    stores
WHERE
    stor_address LIKE '%Ave.';

-- 5) Stores located in an Avenue OR a Street (ends with Ave. or St.)
SELECT 
    stor_name, stor_address
FROM
    stores
WHERE
    stor_address LIKE '%Ave.'
        OR stor_address LIKE '%St.';

-- 6) Select all female employees (pattern: sex column is typically 'F'/'M')
SELECT 
    *
FROM
    employee
WHERE
    sex = 'F';

-- 7) Male employees whose name starts with "P"
SELECT 
    fname, lname
FROM
    employee
WHERE
    sex = 'M' AND fname LIKE 'P%';

-- 8) Books with "ing" in title, with at least 4 chars before it: ____ing
SELECT 
    *
FROM
    titles
WHERE
    title LIKE '%____ing%';

