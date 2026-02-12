/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 9

*******************************************************************************
*******************************************************************************

HOW TO GET THE SCHEMA OF A DATABASE: 
* Windows/Linux: Ctrl + R
* MacOS: Cmd + R

In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - AS
	- LEFT JOIN
    - RIGHT JOIN
    - INNER JOIN
*/

USE publications;

-- 1) sales as s, select ord_num using table_alias.column
SELECT 
    s.ord_num
FROM
    sales AS s;

-- 2) Title + publisher name of all books
SELECT 
    t.title, p.pub_name
FROM
    titles AS t
        LEFT JOIN
    publishers AS p ON t.pub_id = p.pub_id;

-- 3) Order number, quantity, book title for all sales
SELECT 
    s.ord_num, s.qty, t.title
FROM
    sales AS s
        LEFT JOIN
    titles AS t ON s.title_id = t.title_id;

-- 4) Full name of employees + publisher name they work for
SELECT 
    CONCAT(e.fname, ' ', e.lname) AS full_name, p.pub_name
FROM
    employee AS e
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id;

-- 5) Full name + job description of all employees
SELECT 
    CONCAT(e.fname, ' ', e.lname) AS full_name, j.job_desc
FROM
    employee AS e
        LEFT JOIN
    jobs AS j ON e.job_id = j.job_id;

-- 6) Full name + job desc + publisher name (2 joins)
SELECT 
    CONCAT(e.fname, ' ', e.lname) AS full_name,
    j.job_desc,
    p.pub_name
FROM
    employee AS e
        LEFT JOIN
    jobs AS j ON e.job_id = j.job_id
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id;

-- 7) Same but only employees at "Binnet & Hardley"
SELECT 
    CONCAT(e.fname, ' ', e.lname) AS full_name,
    j.job_desc,
    p.pub_name
FROM
    employee AS e
        LEFT JOIN
    jobs AS j ON e.job_id = j.job_id
        LEFT JOIN
    publishers AS p ON e.pub_id = p.pub_id
WHERE
    p.pub_name = 'Binnet & Hardley';

-- 8) Publisher name + PR info for publishers in Berkeley, CA
SELECT 
    p.pub_name, pi.pr_info
FROM
    publishers AS p
        LEFT JOIN
    pub_info AS pi ON p.pub_id = pi.pub_id
WHERE
    p.city = 'Berkeley' AND p.state = 'CA';

-- 9) All columns from discounts
SELECT 
    *
FROM
    discounts;

-- 10) All stores + their discounts (include stores even if NULL discount)
--     stor_id selected twice (stores + discounts)
SELECT 
    st.stor_name,
    st.stor_id AS stor_id_stores,
    d.stor_id AS stor_id_discounts,
    d.discount
FROM
    stores AS st
        LEFT JOIN
    discounts AS d ON st.stor_id = d.stor_id;

-- 11) Stores + discounts, but exclude stores with no discount (change join type)
SELECT 
    st.stor_name, d.discount
FROM
    stores AS st
        INNER JOIN
    discounts AS d ON st.stor_id = d.stor_id;
