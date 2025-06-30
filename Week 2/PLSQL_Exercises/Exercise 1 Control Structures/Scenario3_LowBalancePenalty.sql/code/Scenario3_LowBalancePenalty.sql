-- Step 1: Create the customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    balance NUMBER,
    loan_interest_rate NUMBER
);

-- Step 2: Insert sample data
INSERT INTO customers VALUES (1, 'Alice', 12000, 7.5);
INSERT INTO customers VALUES (2, 'Bob', 4000, 8.0);
INSERT INTO customers VALUES (3, 'Carol', 3000, 7.8);

-- Step 3: PL/SQL block to apply penalty for low-balance customers
BEGIN
    FOR cust IN (SELECT * FROM customers) LOOP
        IF cust.balance < 5000 THEN
            UPDATE customers
            SET loan_interest_rate = loan_interest_rate + 1
            WHERE customer_id = cust.customer_id;

            DBMS_OUTPUT.PUT_LINE('1% penalty applied to: ' || cust.name);
        END IF;
    END LOOP;
END;
/

-- Step 4: Check final updated table
SELECT * FROM customers;