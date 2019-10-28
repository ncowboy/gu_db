DROP DATABASE IF EXISTS gu_db_lesson5;
CREATE DATABASE gu_db_lesson5;
USE gu_db_lesson5;
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    value INT DEFAULT 0
);
INSERT INTO storehouses_products (name, value) VALUES ('product1', 1);
INSERT INTO storehouses_products (name, value) VALUES ('product2', 0);
INSERT INTO storehouses_products (name, value) VALUES ('product3', 0);
INSERT INTO storehouses_products (name, value) VALUES ('product4', 0);
INSERT INTO storehouses_products (name, value) VALUES ('product5', 15);
INSERT INTO storehouses_products (name, value) VALUES ('product6', 20);
INSERT INTO storehouses_products (name, value) VALUES ('product7', 18);
INSERT INTO storehouses_products (name, value) VALUES ('product8', 2);
INSERT INTO storehouses_products (name, value) VALUES ('product9', 5);
INSERT INTO storehouses_products (name, value) VALUES ('product10', 10);

SELECT * FROM storehouses_products ORDER BY IF(value=0, 1, 0), value;