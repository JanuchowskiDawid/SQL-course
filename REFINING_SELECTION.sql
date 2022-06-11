SELECT DISTINCT CONCAT(author_lname,',',author_fname) AS author FROM books;

SELECT DISTINCT author_lname,author_fname AS author FROM books;

SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 10;

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';

SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE'___';

SELECT title FROM books WHERE 1 LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title,' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT UPPER(CONCAT('My favourite author is ', author_fname,' ', author_lname,'!')) AS yell FROM books ORDER BY author_lname;