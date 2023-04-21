-- SQL-команды для создания таблиц
CREATE TABLE employees(employee_id SERIAL PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(100),title VARCHAR(100),birth_date DATE,notes text);
CREATE TABLE customers(customer_id VARCHAR(50) PRIMARY KEY, company_name VARCHAR(100), contact_name VARCHAR(100));
CREATE TABLE orders(order_id INT PRIMARY KEY, customer_id varchar(100), employee_id INT REFERENCES employees.employee_id, order_date VARCHAR(100), ship_city VARCHAR(100));