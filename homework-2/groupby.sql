-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)

SELECT
    DISTINCT(ship_city) as city,
    ship_country
FROM
    orders
WHERE(
    ship_city LIKE '%burg'
);

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.

SELECT
    order_id,
    customer_id,
    freight,
    ship_country
FROM
    orders
WHERE(
    ship_country LIKE 'P%'
)
ORDER BY
    freight DESC
LIMIT 10;

-- 3. фамилию и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)

SELECT
    last_name,
    home_phone
FROM
    employees
WHERE(
    region IS NULL
);

-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране

SELECT
    DISTINCT(country) as country,
    COUNT(supplier_id) as supplier_counter
FROM
    suppliers
GROUP BY
    country
ORDER BY
    supplier_counter DESC;

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)

SELECT
    ship_country as country,
    SUM(freight) as freight
FROM
    orders
WHERE(
    freight > 2750 AND ship_region IS NOT NULL
)
GROUP BY
    country
ORDER BY
    freight DESC;

-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).

SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
INTERSECT
SELECT country FROM employees;

-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).

SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
EXCEPT
SELECT country FROM employees;
