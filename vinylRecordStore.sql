-- SQL for Humans: Learn to Query Real Databases Without Technical Background
-- Omar S. Gómez, 2026
-- Demo Database for SQLiteOnline.com
-- Theme: Vinyl Record Store & Music Distribution Company
-- Beginner-Friendly Practice Database

-- =====================================================
-- TABLES
-- =====================================================

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS inventory;

-- =====================================================
-- CUSTOMERS
-- =====================================================

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    city TEXT,
    country TEXT,
    email TEXT,
    signup_date TEXT
);

-- =====================================================
-- ARTISTS
-- =====================================================

CREATE TABLE artists (
    artist_id INTEGER PRIMARY KEY,
    artist_name TEXT,
    country TEXT,
    genre TEXT
);

-- =====================================================
-- ALBUMS
-- =====================================================

CREATE TABLE albums (
    album_id INTEGER PRIMARY KEY,
    artist_id INTEGER,
    album_title TEXT,
    release_year INTEGER,
    format TEXT,
    price REAL,
    stock INTEGER,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- =====================================================
-- EMPLOYEES
-- =====================================================

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    role TEXT,
    hire_date TEXT,
    salary REAL
);

-- =====================================================
-- ORDERS
-- =====================================================

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    total_amount REAL,
    payment_method TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =====================================================
-- ORDER ITEMS
-- =====================================================

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    album_id INTEGER,
    quantity INTEGER,
    item_price REAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- =====================================================
-- INVENTORY
-- =====================================================

CREATE TABLE inventory (
    inventory_id INTEGER PRIMARY KEY,
    album_id INTEGER,
    warehouse_location TEXT,
    last_restock_date TEXT,
    supplier_name TEXT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- =====================================================
-- INSERT ARTISTS
-- =====================================================

INSERT INTO artists VALUES
(1, 'Omar G2', 'Mexico', 'Uplifting Trance'),
(2, 'Solar Echoes', 'Germany', 'Progressive Trance'),
(3, 'Vinyl Horizon', 'United Kingdom', 'House'),
(4, 'Aurora Pulse', 'Netherlands', 'Trance'),
(5, 'Midnight Frequency', 'United States', 'Synthwave'),
(6, 'Deep Circuit', 'Canada', 'Techno'),
(7, 'Neon Skyline', 'France', 'Electronic');

-- =====================================================
-- INSERT ALBUMS
-- =====================================================

INSERT INTO albums VALUES
(1, 1, 'Le Tour de Trance', 2024, 'Vinyl', 29.99, 45),
(2, 1, 'Trance Andina Vol. 8', 2025, 'Vinyl', 34.99, 30),
(3, 1, 'Euphoric Horizons', 2023, 'CD', 14.99, 80),
(4, 2, 'Echoes Beyond Time', 2022, 'Vinyl', 27.99, 25),
(5, 2, 'Night Drive Frequencies', 2021, 'Digital', 9.99, 999),
(6, 3, 'City Lights Sessions', 2020, 'Vinyl', 24.99, 18),
(7, 4, 'Skyline Dreams', 2024, 'Vinyl', 31.99, 40),
(8, 4, 'Oceanic State', 2023, 'CD', 15.99, 55),
(9, 5, 'Retro Midnight', 2021, 'Cassette', 19.99, 22),
(10, 6, 'Machine Rhythm', 2022, 'Vinyl', 28.99, 35),
(11, 7, 'Future Neon', 2025, 'Digital', 11.99, 999),
(12, 3, 'Sunset Grooves', 2021, 'Vinyl', 26.99, 12);

-- =====================================================
-- INSERT CUSTOMERS
-- =====================================================

INSERT INTO customers VALUES
(1, 'Emily', 'Johnson', 'New York', 'USA', 'emily.johnson@email.com', '2024-01-10'),
(2, 'Carlos', 'Ramirez', 'Mexico City', 'Mexico', 'carlos.r@email.com', '2024-02-14'),
(3, 'Sophie', 'Martin', 'Paris', 'France', 'sophie.m@email.com', '2024-03-20'),
(4, 'Daniel', 'Lee', 'Toronto', 'Canada', 'daniel.lee@email.com', '2024-04-11'),
(5, 'Lucia', 'Fernandez', 'Madrid', 'Spain', 'lucia.f@email.com', '2024-05-01'),
(6, 'Nathan', 'Walker', 'Chicago', 'USA', 'nathan.w@email.com', '2024-06-15'),
(7, 'Aiko', 'Tanaka', 'Tokyo', 'Japan', 'aiko.t@email.com', '2024-07-09'),
(8, 'Oliver', 'Smith', 'London', 'UK', 'oliver.s@email.com', '2024-08-12'),
(9, 'Camila', 'Gomez', 'Quito', 'Ecuador', 'camila.g@email.com', '2024-09-18'),
(10, 'Lucas', 'Brown', 'Sydney', 'Australia', 'lucas.b@email.com', '2024-10-05');

-- =====================================================
-- INSERT EMPLOYEES
-- =====================================================

INSERT INTO employees VALUES
(1, 'Michael', 'Davis', 'Store Manager', '2021-03-10', 4200),
(2, 'Sarah', 'Wilson', 'Sales Associate', '2022-07-14', 2800),
(3, 'Kevin', 'Miller', 'Inventory Specialist', '2023-01-21', 3100),
(4, 'Laura', 'Perez', 'Marketing Coordinator', '2022-09-01', 3600);

-- =====================================================
-- INSERT ORDERS
-- =====================================================

INSERT INTO orders VALUES
(1, 1, '2025-01-05', 59.98, 'Credit Card'),
(2, 2, '2025-01-12', 34.99, 'PayPal'),
(3, 3, '2025-01-15', 42.98, 'Credit Card'),
(4, 4, '2025-02-01', 29.99, 'Debit Card'),
(5, 5, '2025-02-08', 55.98, 'PayPal'),
(6, 6, '2025-02-14', 24.99, 'Credit Card'),
(7, 7, '2025-03-02', 69.98, 'Credit Card'),
(8, 8, '2025-03-05', 31.99, 'PayPal'),
(9, 9, '2025-03-18', 49.98, 'Debit Card'),
(10, 10, '2025-04-01', 28.99, 'Credit Card');

-- =====================================================
-- INSERT ORDER ITEMS
-- =====================================================

INSERT INTO order_items VALUES
(1, 1, 1, 2, 29.99),
(2, 2, 2, 1, 34.99),
(3, 3, 4, 1, 27.99),
(4, 3, 5, 1, 14.99),
(5, 4, 1, 1, 29.99),
(6, 5, 7, 1, 31.99),
(7, 5, 8, 1, 23.99),
(8, 6, 6, 1, 24.99),
(9, 7, 2, 2, 34.99),
(10, 8, 7, 1, 31.99),
(11, 9, 10, 1, 28.99),
(12, 9, 9, 1, 19.99),
(13, 10, 10, 1, 28.99);

-- =====================================================
-- INSERT INVENTORY
-- =====================================================

INSERT INTO inventory VALUES
(1, 1, 'Warehouse A', '2025-01-02', 'Global Vinyl Supply'),
(2, 2, 'Warehouse A', '2025-01-15', 'Global Vinyl Supply'),
(3, 3, 'Warehouse B', '2025-01-10', 'Digital Media Co'),
(4, 4, 'Warehouse B', '2025-02-01', 'European Pressing Ltd'),
(5, 5, 'Cloud Storage', '2025-02-01', 'Digital Media Co'),
(6, 6, 'Warehouse C', '2025-02-20', 'Retro Sound Distributors'),
(7, 7, 'Warehouse A', '2025-03-01', 'Global Vinyl Supply'),
(8, 8, 'Warehouse B', '2025-03-03', 'Digital Media Co'),
(9, 9, 'Warehouse C', '2025-03-10', 'Cassette World'),
(10, 10, 'Warehouse A', '2025-03-15', 'Techno Press Ltd'),
(11, 11, 'Cloud Storage', '2025-03-18', 'Digital Media Co'),
(12, 12, 'Warehouse C', '2025-03-20', 'Retro Sound Distributors');
