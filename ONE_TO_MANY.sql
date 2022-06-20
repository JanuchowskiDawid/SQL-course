SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name= 'George');

SELECT * FROM customers, orders; --wyświetla wszystkie wiersze połączone z każdym wierszem, każda możliwa kombinacja.

SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

SELECT * FROM customers
JOIN orders
	ON customers.id = orders.customer_id;

SELECT * FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id;

SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

CREATE TABLE students(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100)
);


CREATE TABLE papers(
title VARCHAR(100),
grade INT,
student_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES students(id)
);

SELECT first_name, title, grade FROM students
JOIN papers
	ON students.id = papers.student_id
ORDER BY grade DESC;
 

SELECT first_name, title, grade FROM students
LEFT JOIN papers
	ON students.id = papers.student_id;

SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade,'0') FROM students
LEFT JOIN papers
	ON students.id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade), '0') AS average FROM students
LEFT JOIN papers
	ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


SELECT 
	first_name, 
	IFNULL(AVG(grade), '0') AS average, 
	CASE
	WHEN AVG(grade) >=75 THEN 'PASSING'
	ELSE 'FAILING'
	END AS 'passing_status'
	FROM students
LEFT JOIN papers
	ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;