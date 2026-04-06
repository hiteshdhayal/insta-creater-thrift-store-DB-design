-- CUSTOMER
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    instagram VARCHAR(50)
);

-- PRODUCT
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    type VARCHAR(20)
);

-- PRODUCT_VARIANT
CREATE TABLE product_variants (
    variant_id INT PRIMARY KEY,
    product_id INT,
    size VARCHAR(10),
    color VARCHAR(20),
    stock INT CHECK (stock >= 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ORDER_ITEMS
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    variant_id INT,
    qty INT CHECK (qty > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

-- PAYMENT
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- SHIPPING
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    courier VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
