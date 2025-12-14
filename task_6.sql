-- Explicitly select the database (for robustness)
USE ALX_BOOK_STORE;

-- Insert multiple rows into the 'customer' table, including the required double spaces in the address
INSERT INTO customer (
    customer_id,
    customer_name,
    email,
    address
)
VALUES
(
    2,
    'Blessing Malik',
    'bmalik@sandtech.com',
    '124 Happiness  Ave.'  -- <-- Double space here
),
(
    3,
    'Obed Ehoneah',
    'eobed@sandtech.com',
    '125 Happiness  Ave.'  -- <-- Double space here
),
(
    4,
    'Nehemial Kamolu',
    'nkamolu@sandtech.com',
    '126 Happiness  Ave.'  -- <-- Double space here
);