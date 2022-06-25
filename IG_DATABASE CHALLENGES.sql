#Find the 5 oldest users	1
use ig_clone;

SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;

#What day of the week do most users register on?	2

SELECT DAYNAME(created_at) FROM users
GROUP BY DAYNAME(created_at)
ORDER BY COUNT(id) DESC
LIMIT 1;

#Find the users who have never posted a photo	3

SELECT username 
FROM users
LEFT JOIN photos 
	ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

#We're running a new contest to see who can get the most likes on a single photo.	4---------

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;
	
#How many times does the average user post?	5-------

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 

#What are the top 5 most commonly used hashtags?	6

SELECT tag_name, COUNT(photo_tags.tag_id) AS uses
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY uses DESC
LIMIT 5;

#Find users who have liked every single photo on the site	7

SELECT username FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING COUNT(likes.photo_id) = (SELECT COUNT(*) FROM photos);