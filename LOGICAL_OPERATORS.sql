SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

SELECT title FROM books WHERE title NOT LIKE 'W%';
 
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

'a' > 'b'
-- false
 
'A' > 'a'
-- false
 
'A' >=  'a'
-- true

SELECT title, released_year FROM books
WHERE released_year <= 2000;

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985); 

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;

# False TRUE TRUE

SELECT * FROM books WHERE released_year<1980;

SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title LIKE '%just kids%' OR title LIKE '%A hEartbreaking work%' THEN 'Memoir'
		ELSE 'Novel'
	END AS 'TYPE'
FROM books;

SELECT title, author_lname,
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
		ELSE CONCAT(COUNT(*), ' books')
	END AS 'COUNT'
FROM books
GROUP BY author_lname, author_fname; 
