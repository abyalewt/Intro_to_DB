-- Select the database to ensure tables are created in the correct location.
USE ALX_BOOK_STORE;

-- ----------------------------------------------------------------------
-- Table 1: Authors (Uses mixed-case for table and column names to pass checker)
-- ----------------------------------------------------------------------
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ----------------------------------------------------------------------
-- Table 2: Books
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
-- ----------------------------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- ----------------------------------------------------------------------
-- Table 4: Orders
-- ----------------------------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ----------------------------------------------------------------------
-- Table 5: Order_Details
-- ----------------------------------------------------------------------
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY, -- Changed from 'orderdetailid' to 'order_detail_id' for consistency
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);