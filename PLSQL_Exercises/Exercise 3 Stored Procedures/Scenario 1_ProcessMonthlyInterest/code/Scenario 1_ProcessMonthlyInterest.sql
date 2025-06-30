-- Drop table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE savings_accounts';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Create the table
CREATE TABLE savings_accounts (
    account_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    balance NUMBER
);

-- Insert sample data
INSERT INTO savings_accounts VALUES (101, 'Alice', 10000);
INSERT INTO savings_accounts VALUES (102, 'Bob', 5000);
INSERT INTO savings_accounts VALUES (103, 'Carol', 7500);

-- Create the procedure
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    FOR acc IN (SELECT * FROM savings_accounts) LOOP
        UPDATE savings_accounts
        SET balance = balance + (balance * 0.01)
        WHERE account_id = acc.account_id;

        DBMS_OUTPUT.PUT_LINE('Interest added for account: ' || acc.account_id);
    END LOOP;
END;
/

-- Enable DBMS output
SET SERVEROUTPUT ON;

-- Call the procedure
BEGIN
    ProcessMonthlyInterest;
END;
/
