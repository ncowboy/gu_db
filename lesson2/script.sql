/*

*/
DROP DATABASE if EXISTS example;
DROP DATABASE if EXISTS sample;
CREATE DATABASE example;
CREATE DATABASE sample;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT(11),
    name VARCHAR(64)
);


