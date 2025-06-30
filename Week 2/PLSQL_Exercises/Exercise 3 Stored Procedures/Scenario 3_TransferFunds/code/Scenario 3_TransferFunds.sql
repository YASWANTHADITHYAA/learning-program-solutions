CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    balance NUMBER
);

INSERT INTO accounts VALUES (1, 'Alice', 10000);
INSERT INTO accounts VALUES (2, 'Bob', 6000);
INSERT INTO accounts VALUES (3, 'Carol', 8000);

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) AS
    v_from_balance NUMBER;
BEGIN
    SELECT balance INTO v_from_balance
    FROM accounts
    WHERE account_id = p_from_account;

    IF v_from_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Transfer failed: insufficient balance in account ' || p_from_account);
    ELSE
        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account;

        DBMS_OUTPUT.PUT_LINE('Transferred ₹' || p_amount || ' from account ' || p_from_account || ' to account ' || p_to_account);
    END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
    TransferFunds(1, 3, 2000);
END;
/

SELECT * FROM accounts;