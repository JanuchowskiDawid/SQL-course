SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name= 'George');

SELECT * FROM customers, orders; --wyświetla wszystkie wiersze połączone z każdym wierszem, każda możliwa kombinacja.