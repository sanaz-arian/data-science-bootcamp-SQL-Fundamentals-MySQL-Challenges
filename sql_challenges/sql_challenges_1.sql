/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 1

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
	- SELECT FROM
    - AS
	- DISTINCT

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

-- 1) Select everything from authors
SELECT 
    *
FROM
    authors;

-- 2) Select everything from titles, titleauthor, publishers, sales (one at a time)
SELECT 
    *
FROM
    titles;
SELECT 
    *
FROM
    titleauthor;
SELECT 
    *
FROM
    publishers;
SELECT 
    *
FROM
    sales;

-- 3) Select authors first and last name
SELECT 
    au_fname, au_lname
FROM
    authors;

-- 4) Select publisher names
SELECT 
    pub_name
FROM
    publishers;

-- 5) Select title, price, ytd_sales of all titles
SELECT 
    title, price, ytd_sales
FROM
    titles;

-- 6) Select authors first names, but display as "first_name"
SELECT 
    au_fname AS first_name
FROM
    authors;

-- 7) Select job_id and job_desc, but display as "id" and "description"
SELECT 
    job_id AS id, job_desc AS description
FROM
    jobs;

-- 8) Select all unique last names of authors
SELECT DISTINCT
    au_lname
FROM
    authors;

-- 9) Select all unique title_id's involved in a sale
SELECT DISTINCT
    title_id
FROM
    sales;
