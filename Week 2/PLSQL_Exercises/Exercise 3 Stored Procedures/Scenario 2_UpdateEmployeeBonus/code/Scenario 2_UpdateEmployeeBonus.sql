-- Step 1: Create the employees table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department VARCHAR2(50),
    salary NUMBER
);

-- Step 2: Insert sample employee data
INSERT INTO employees VALUES (1, 'Alice', 'HR', 30000);
INSERT INTO employees VALUES (2, 'Bob', 'IT', 40000);
INSERT INTO employees VALUES (3, 'Carol', 'HR', 32000);
INSERT INTO employees VALUES (4, 'David', 'IT', 42000);
INSERT INTO employees VALUES (5, 'Eve', 'Finance', 35000);

-- Step 3: Create the stored procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
) AS
BEGIN
    FOR emp IN (
        SELECT * FROM employees WHERE department = p_department
    ) LOOP
        UPDATE employees
        SET salary = salary + (salary * p_bonus_percent / 100)
        WHERE emp_id = emp.emp_id;

        DBMS_OUTPUT.PUT_LINE(
            'Bonus applied to: ' || emp.name || ', New Salary: ' ||
            TO_CHAR(emp.salary + (emp.salary * p_bonus_percent / 100))
        );
    END LOOP;
END;
/

-- Step 4: Enable DBMS output
SET SERVEROUTPUT ON;

-- Step 5: Call the procedure (Example: give 10% bonus to IT department)
BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/

-- Step 6: Show updated salaries (this will show in Script Output tab)
SELECT * FROM employees;
