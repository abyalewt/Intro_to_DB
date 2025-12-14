-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- ----------------------------------------------------------------------
-- Table 1: Authors
-- Stores information about authors.
-- ----------------------------------------------------------------------
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ----------------------------------------------------------------------
-- Table 2: Books
-- Stores information about books available in the bookstore.
-- ----------------------------------------------------------------------
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- ----------------------------------------------------------------------
-- Table 3: Customers
-- Stores information about customers.
-- ----------------------------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- ----------------------------------------------------------------------
-- Table 4: Orders
-- Stores information about orders placed by customers.
-- ----------------------------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ----------------------------------------------------------------------
-- Table 5: Order_Details
-- Stores information about the books included in each order.
-- ----------------------------------------------------------------------
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);