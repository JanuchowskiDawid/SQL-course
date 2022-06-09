DELETE FROM cats WHERE age=4;

DELETE FROM cats WHERE age = cat_id;

DELETE FROM cats;

SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

UPDATE shirts SET shirt_size = 'L' WHERE article='polo shirt';

UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;

UPDATE shirts SET shirt_size='XS', color = 'off white' WHERE color = 'white'; 

DELETE FROM shirts WHERE last_worn=200;

DELETE FROM shirts WHERE article= 'tank top';

DELETE FROM shirts;

DROP TABLE shirts;

show tables;

