--  Создание БД datebase_sql_task_2
DROP DATABASE IF EXISTS datebase_sql_task_2;
CREATE DATABASE datebase_sql_task_2;

-- Выбираем активную БД
USE datebase_sql_task_2;

/* Задача 1:
Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными. 
*/

CREATE table sales (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
count_product INT UNSIGNED
);

INSERT INTO sales (id, order_date, count_product)
VALUES (1, '2022-01-01', 156),
       (2, '2022-01-02', 180),
       (3, '2022-01-03', 21),
       (4, '2022-01-04', 124),
       (5, '2022-01-05', 341);

-- Вывод базы данных sales
  SELECT * FROM datebase_sql_task_2.sales;
  
/* Задача 2:
Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT id AS "id заказа",
CASE 
	WHEN count_product < 100 THEN "Маленький заказ"
	WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
	WHEN count_product > 100 THEN "Большой заказ"
END AS "Тип заказа" FROM sales;

/* Задача 3:
Создайте таблицу “orders”, заполните ее значениями
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

CREATE TABLE orders (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
employee_id VARCHAR(3),
amount DECIMAL(5,2),
order_status VARCHAR(10)
);

INSERT INTO orders (id, employee_id, amount, order_status)
VALUES (1, 'e03', 15.00, 'OPEN'),
       (2, 'e01', 25.50, 'OPEN'),
       (3, 'e05', 100.70, 'CLOSED'),
       (4, 'e02', 22.18, 'OPEN'),
       (5, 'e04', 9.50, 'CANCELLED');

-- Вывод базы данных orders
  SELECT * FROM datebase_sql_task_2.orders;

SELECT 
CASE  
	WHEN order_status = 'OPEN' THEN 'Order is in open state' 
	WHEN order_status = 'CLOSED' THEN 'Order is closed' 
	WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS full_order_status FROM orders;

/* Задача 4:
0 (ноль) это целочисленное значение, являющиеся полноценным значением, 
над которым можно совершать арифметические действия и логические операции.
NULL –  это не значение, это специальный тип данных, который используется 
для представления отсутствующих значений в столбцах таблицы. Другими словами, можно сказать, 
что это "заполнитель" для значения данных, которое неизвестно или не указано. 
Математические операции не могут быть выполнены с null (результат любой такой операции не определен и, 
следовательно, также обычно представляется как null).
 */
