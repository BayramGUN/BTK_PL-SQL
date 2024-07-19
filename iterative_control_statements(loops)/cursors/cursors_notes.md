# Oracle PL/SQL Cursors

Cursors are memory areas in which Oracle executes SQL statements.

## Types of Cursors

### Implicit Cursors

- Automatically created by Oracle when a SQL statement is executed.
- Used for single-row queries or DML (Data Manipulation Language) operations like `INSERT`, `UPDATE`, or `DELETE`.
- Accessed using:
  - `SQL%ROWCOUNT`.
  - `SQL%FOUND`.
  - `SQL%NOTFOUND`.
  - `SQL%ISOPEN`.

### Explicit Cursors

- Defined by the programmer to handle queries that return multiple rows.
- Provides more control over the query process and allows fetching rows one at a time.

## Working with Explicit Cursors

### Declaration

An explicit cursor is declared in the `DECLARE` section of a PL/SQL block.

```plsql
CURSOR cursor_name IS
    SELECT_statement;
```

### Opening the Cursor

The cursor must be opened before fetching rows.

```plsql
OPEN cursor_name;
```

### Fetching Rows

Fetch rows from the cursor one at a time using the `FETCH` statement.

```plsql
FETCH cursor_name INTO variable_list;
```

You can also use a `FETCH` statement inside a `LOOP` to iterate over all rows.

### Closing the Cursor

After fetching all necessary rows, the cursor should be closed to free resources.

```plsql
CLOSE cursor_name;
```

## Example of Using an Explicit Cursor

```plsql
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name FROM employees WHERE department_id = 10;
    
    v_emp_id employees.emp_id%TYPE;
    v_emp_name employees.emp_name%TYPE;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO v_emp_id, v_emp_name;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id || ', Employee Name: ' || v_emp_name);
    END LOOP;
    
    CLOSE emp_cursor;
END;
```

## Additional Cursor Features

- **Cursor Attributes**: `cursor_name%FOUND`, `cursor_name%NOTFOUND`, `cursor_name%ROWCOUNT`, and `cursor_name%ISOPEN` provide information about the cursor's state and operations.
- **Cursor FOR Loop**: A more concise way to handle cursors, which automatically opens, fetches, and closes the cursor.

```plsql
FOR record IN (SELECT emp_id, emp_name FROM employees WHERE department_id = 10) LOOP
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || record.emp_id || ', Employee Name: ' || record.emp_name);
END LOOP;
```

Cursors are essential for handling complex queries and processing multiple rows of data efficiently in PL/SQL.
