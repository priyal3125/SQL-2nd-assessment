create database country;
use country;

-- STEP 1: Create Tables
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- STEP 2: Insert Data
INSERT INTO country (country_id, country_name)
VALUES
(1, 'Germany'),
(2, 'Croatia'),
(3, 'USA'),
(4, 'Spain'),
(5, 'Russia');

INSERT INTO city (city_id, city_name, country_id)
VALUES
(1, 'Berlin', 1),
(2, 'Zagreb', 2),
(3, 'New York', 3);

INSERT INTO customer (customer_id, customer_name, city_id)
VALUES
(1, 'Alice', 1),
(2, 'Bob', 1),
(3, 'Charlie', 2),
(4, 'Diana', 3);

-- STEP 3: Query (INNER + LEFT JOIN)
SELECT 
    co.country_name AS country,
    ci.city_name AS city,
    cu.customer_name AS customer
FROM country co
INNER JOIN city ci 
    ON co.country_id = ci.country_id
LEFT JOIN customer cu 
    ON ci.city_id = cu.city_id
ORDER BY co.country_name, ci.city_name, cu.customer_name;