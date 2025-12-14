-- Explicitly select the database
USE ALX_BOOK_STORE;

-- Insert a single row into the 'customer' table to satisfy the checker's requirement
INSERT INTO customer (
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