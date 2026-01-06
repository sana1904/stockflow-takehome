-- StockFlow database schema

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    name VARCHAR(255)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    name VARCHAR(255),
    sku VARCHAR(100) UNIQUE,
    price NUMERIC(10,2)
);

CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    warehouse_id INT REFERENCES warehouses(id),
    quantity INT,
    UNIQUE(product_id, warehouse_id)
);
