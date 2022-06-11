SELECT COUNT(title WHERE title LIKE "%the%") FROM books;

 
SELECT title, author_lname FROM books
GROUP BY author_lname;
 
SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;
 
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
 
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
  
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
 
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

SELECT MIN(pages) FROM books;
 
SELECT MAX(pages) 
FROM books;

SELECT title, pages FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 
 
SELECT * FROM books 
ORDER BY pages ASC LIMIT 1;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;

SELECT COUNT(*) AS NO_OF_BOOKS FROM books;

SELECT released_year, COUNT(*) AS 'Number of books' FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) AS 'total no of books' FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS 'author full name' FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT 
	released_year AS year,
	COUNT(*) AS '# books',
	AVG(pages) as 'avg pages'
FROM
	books
GROUP BY
	released_year;
