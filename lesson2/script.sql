/*
1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы
help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

/*
~/.my.cnf
[client]
host=localhost
user=root
password=**********
socket=/var/run/mysqld/mysqld.sock
*/
DROP DATABASE if EXISTS example;
DROP DATABASE if EXISTS sample;
CREATE DATABASE example;
CREATE DATABASE sample;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id   INT(11),
    name VARCHAR(64)
);


