CREATE DATABASE IF NOT EXISTS admin_class_teaching;

USE admin_class_teaching;

DROP TABLE IF EXISTS person;

CREATE TABLE IF NOT EXISTS person
(
    person_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    eye_color VARCHAR(15),
    birth_date DATETIME,
    street VARCHAR(30),
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code INT
);