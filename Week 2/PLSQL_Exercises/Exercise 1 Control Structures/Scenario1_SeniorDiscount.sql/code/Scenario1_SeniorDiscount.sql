-- Step 1: Create the customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER,
    loan_interest_rate NUMBER
);

-- Step 2: Insert sample data
INSERT INTO customers VALUES (1, 'Alice', 65, 8.5);
INSERT INTO customers VALUES (2, 'Bob', 55, 7.9);
INSERT INTO customers VALUES (3, 'Carol', 70, 9.0);

-- Step 3: PL/SQL block to apply 1% discount for customers over 60
BEGIN
    FOR cust IN (SELECT * FROM customers) LOOP
        IF cust.age > 60 THEN
            UPDATE customers
            SET loan_interest_rate = loan_interest_rate - 1
            WHERE customer_id = cust.customer_id;

            DBMS_OUTPUT.PUT_LINE('1% discount applied to: ' || cust.name);
        END IF;
    END LOOP;
END;
/

-- Step 4: View final updated table
SELECT * FROM customers;