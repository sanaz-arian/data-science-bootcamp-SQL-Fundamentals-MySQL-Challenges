/******************************************************************************
*******************************************************************************

SQL CHALLENGES 11

*******************************************************************************
*******************************************************************************/

USE publications;

-- 1) In which cities has “Is Anger the Enemy?” been sold?
SELECT DISTINCT
    st.city
FROM
    titles AS t
        LEFT JOIN
    sales AS s ON t.title_id = s.title_id
        LEFT JOIN
    stores AS st ON s.stor_id = st.stor_id
WHERE
    t.title = 'Is Anger the Enemy?'
 


-- 2) Book titles linked to employee Howard Snyder (same publisher)

SELECT DISTINCT
    t.title
FROM
    titles AS t
WHERE
    t.pub_id = (SELECT 
            e.pub_id
        FROM
            `employee` AS e
        WHERE
            e.fname = 'Howard'
                AND e.lname = 'Snyder'
        LIMIT 1)






-- 3) Book title with the highest number of sales (total qty)
SELECT 
    t.title, SUM(s.qty) AS total_qty_sold
FROM
    sales AS s
        JOIN
    titles AS t ON s.title_id = t.title_id
GROUP BY t.title
ORDER BY total_qty_sold DESC
LIMIT 1


-- 4) All book titles + full name of their author(s)
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS author_full_name
FROM
    titles AS t
        JOIN
    titleauthor AS ta ON t.title_id = ta.title_id
        JOIN
    authors AS a ON ta.au_id = a.au_id
ORDER BY t.title , author_full_name;


-- 5) Full names of authors of Psychology books (no duplicates)
SELECT DISTINCT
    CONCAT(a.au_fname, ' ', a.au_lname) AS author_full_name
FROM
    titles AS t
        JOIN
    titleauthor AS ta ON t.title_id = ta.title_id
        JOIN
    authors AS a ON ta.au_id = a.au_id
WHERE
    t.type = 'psychology'
ORDER BY author_full_name;


-- 6) Explore roysched for one title_id (example: BU1111)
SELECT 
    *
FROM
    roysched
WHERE
    title_id = 'BU1111'
ORDER BY lorange;


-- 7) Book titles + maximum royalty they can reach (from roysched)
SELECT 
    t.title, MAX(r.royalty) AS max_royalty
FROM
    roysched AS r
        JOIN
    titles AS t ON r.title_id = t.title_id
GROUP BY t.title
ORDER BY max_royalty DESC , t.title;
