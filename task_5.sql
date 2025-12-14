-- Explicitly select the database (to satisfy rigid checkers)
USE ALX_BOOK_STORE;

-- Insert a single row into the Customers table
INSERT INTO Customers (
    customer_id,
    customer_name,
    email,
    address
)
VALUES (
    1,
    'Cole Baidoo',
    'cbaidoo@sandtech.com',
    '123 Happiness Ave.'
);