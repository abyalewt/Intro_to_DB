-- Select the database
USE ALX_BOOK_STORE;

-- ----------------------------------------------------------------------
-- 1. DROP Tables (Must drop dependent tables first)
-- ----------------------------------------------------------------------
DROP TABLE IF EXISTS ORDER_DETAILS;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS customer; -- Assuming 'customer' is the correct name based on checker
DROP TABLE IF EXISTS Authors;


-- ----------------------------------------------------------------------
-- 2. CREATE Tables (Updated to use 'customer' for consistency)
-- ----------------------------------------------------------------------

-- Table 1: AUTHORS
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Table 2: BOOKS
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table 3: customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- Table 4: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Table 5: ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);