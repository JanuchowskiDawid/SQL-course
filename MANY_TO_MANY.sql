SELECT title, rating FROM series
JOIN reviews ON series.id= series_id;

SELECT title, AVG(rating) as avg_rating
FROM series
JOIN reviews ON series.id= series_id
GROUP BY series_id
ORDER BY AVG(rating);

SELECT first_name, last_name, rating FROM reviewers
JOIN reviews ON reviewers.id= reviewer_id;


SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews 
ON series.id= reviews.series_id
WHERE rating IS NULL;


SELECT genre, AVG(rating) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre
ORDER BY AVG(rating);

	MAX(rating) AS MAX,
	CASE
		WHEN rating IS NOT NULL THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END
SELECT 
	first_name, 
	last_name, 
	IFNULL(COUNT(rating),0) AS COUNT,
	IFNULL(MIN(rating),0) AS MIN,
	IFNULL(MAX(rating),0) AS MAX,
	IFNULL(AVG(rating),0) AS AVG,
	CASE
		WHEN rating IS NOT NULL THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END
FROM reviewers
LEFT JOIN reviews ON reviewers.id= reviewer_id
GROUP BY reviewers.id;


SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviews
JOIN series ON reviews.series_id = series.id
JOIN reviewers ON reviews.reviewer_id = reviewers.id
ORDER BY title;