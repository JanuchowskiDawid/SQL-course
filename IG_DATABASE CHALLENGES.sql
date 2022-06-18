#Find the 5 oldest users
use ig_clone;

SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;

#What day of the week do most users register on?

SELECT DAYNAME(created_at) FROM users
GROUP BY DAYNAME(created_at)
ORDER BY COUNT(id) DESC
LIMIT 1;

#Find the users who have never posted a photo

SELECT username 
FROM users
LEFT JOIN photos 
	ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

#We're running a new contest to see who can get the most likes on a single photo.

SELECT username, COUNT(likes.photo_id)
FROM users
JOIN likes 
	ON users.id = likes.user_id
GROUP BY likes.photo_id
ORDER BY COUNT(likes.photo_id) DESC
LIMIT 1;

#How many times does the average user post?

SELECT COUNT(photos.id)/COUNT(users.id) AS 'POSTS PER USER'
FROM users
LEFT JOIN photos ON users.id = photos.user_id;

#What are the top 5 most commonly used hashtags?

SELECT tag_name, COUNT(photo_tags.tag_id) AS uses
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY uses DESC
LIMIT 5;

#Find users who have liked every single photo on the site

SELECT username FROM users
JOIN likes ON user.id = likes.user_id
GROUP BY user.id
WHERE COUNT(likes.photo_id) = (SELECT COUNT(*) FROM photos);