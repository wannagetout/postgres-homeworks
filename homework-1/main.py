"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2

if __name__ == '__main__':
    with psycopg2.connect(host='localhost', database='north', user='postgres', password='postgres') as conn:
        cur = conn.cursor()
        with open('north_data/employees_data.csv', 'r', encoding='utf-8') as csv_file:
            cur.copy_from(csv_file, 'employees', sep=',')

        with open('north_data/customers_data.csv', 'r') as csv_file:
            cur.copy_from(csv_file, 'customers', sep=',')
            csv_file.close()

        with open('north_data/orders_data.csv', 'r') as csv_file:
            cur.copy_from(csv_file, 'orders', sep=',')
            csv_file.close()

    conn.commit()
    cur.close()
