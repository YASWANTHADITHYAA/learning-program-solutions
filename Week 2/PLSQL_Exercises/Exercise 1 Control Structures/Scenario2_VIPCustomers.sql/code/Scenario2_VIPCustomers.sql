-- Create customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    balance NUMBER,
    is_vip VARCHAR2(5) DEFAULT 'FALSE'
);

-- Insert fresh data
INSERT INTO customers VALUES (1, 'Alice', 12000, 'FALSE');
INSERT INTO customers VALUES (2, 'Bob', 8000, 'FALSE');
INSERT INTO customers VALUES (3, 'Carol', 15000, 'FALSE');

-- Promote VIP customers with balance > 10000
BEGIN
    FOR cust IN (SELECT * FROM customers) LOOP
        IF cust.balance > 10000 THEN
            UPDATE customers
            SET is_vip = 'TRUE'
            WHERE customer_id = cust.customer_id;

            DBMS_OUTPUT.PUT_LINE('VIP status applied to: ' || cust.name);
        END IF;
    END LOOP;
END;
/

-- Check result
SELECT * FROM customers;
