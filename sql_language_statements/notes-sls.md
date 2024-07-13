# SQL Language Statements

SQL, or Structured Query Language, encompasses several categories of statements essential for managing relational databases. **Data Definition Language (DDL)** commands such as CREATE, ALTER, DROP, and TRUNCATE are used to define and modify database objects like tables and indexes. **Data Manipulation Language (DML)** statements—SELECT, INSERT, UPDATE, and DELETE—enable retrieving, adding, modifying, and removing data within tables. **Transaction Control Language (TCL)** commands like COMMIT, ROLLBACK, and SAVEPOINT manage the transactional integrity of database operations. Lastly, **Data Control Language (DCL)** statements—GRANT and REVOKE—control user access rights to database objects. Together, these SQL language statements provide comprehensive tools for schema management, data manipulation, transaction handling, and access control in relational database systems.

![SQL-Lang-State](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyULH3kJ5VNdnOb9yivJcAEGDaGJSqXxnpiST8qulMLJcdSjLV)

- [Data Definition Language (DDL)](#data-definition-language)
  - [Create](#create)
  - [Alter](#alter)
  - [Drop](#drop)
  - [Truncate](#truncate)
  - [Rename](#rename)
  - [Comment](#comment)
- [Data Manipulation Language (DML)](#data-manipulation-language)
  - [Select](#select)
  - [Insert](#insert)
  - [Delete](#delete)
  - [Update](#update)
- [Transaction Control Language (TCL)](#transaction-control-language)
  - [Commit](#commit)
  - [Rollback](#rollback)
  - [SAVEPOINT](#savepoint)
  - [Set Transaction](#set-transaction)

## Data Definition Language

DDL stands for Data Definition Language in Oracle (and other relational database management systems). It is a subset of SQL (Structured Query Language) used to define and manage database structures, such as tables, indexes, and views. DDL statements are used to create, modify, and delete these structures.

Here are some common DDL statements in Oracle:

### Create

> Used to create database objects like tables, indexes, views, etc.

``` sql
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    hire_date DATE
);
```

### Alter

> Used to modify existing database objects, such as adding a column to a table.

```sql
ALTER TABLE employees
ADD (salary NUMBER);
```

### Drop

> Used to delete database objects.

```sql
DROP TABLE employees;
```

### Truncate

> Used to delete all rows from a table **without logging** individual row deletions.

```sql
TRUNCATE TABLE employees;
```

### Rename

> Used to rename a database object.

```sql
RENAME employees TO staff;
```

### Comment

> Used to add comments to the data dictionary.

```sql
COMMENT ON TABLE employees IS 'Employee details';
```

## Data Manipulation Language

Data Manipulation Language (DML) is a subset of SQL (Structured Query Language) used to manipulate data within the database. Unlike DDL (Data Definition Language), which deals with database schema and structure, DML focuses on querying, inserting, updating, and deleting data in the database tables.

### Select

> Retrieves data from one or more tables based on specified criteria.

```sql
SELECT * FROM employees WHERE department_id = 10;
```

### Insert

> Adds new rows of data into a table.

```sql
INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES (101, 'John', 'Doe', '2023-01-15');
```

### Delete

> Removes rows from a table.

```sql
DELETE FROM employees WHERE employee_id = 101;
```

### Update

> Modifies existing data in a table.

```sql
UPDATE employees SET salary = 60000 WHERE employee_id = 101;
```

## Data Control Language

Data Control Language (DCL) is another subset of SQL (Structured Query Language) used to control access to data within a database. Unlike DDL (Data Definition Language) and DML (Data Manipulation Language), which focus on defining and manipulating data and database objects, DCL is concerned with permissions, privileges, and security within the database.

In most database management systems, including Oracle, DCL includes two main commands:

---

### Grant

> This command is used to give specific privileges to database users. Privileges can include the ability to perform certain types of DML or DDL operations on specific database objects.

``` sql
GRANT SELECT, INSERT ON employees TO hr_user;
/*
This statement grants the hr_user the privileges to perform
SELECT and INSERT operations on the employees table.
*/
```

### Revoke

> This command is used to revoke previously granted privileges from users.

``` sql
REVOKE INSERT ON employees FROM hr_user;
/*
This statement revokes the privilege to INSERT into the
employees table from the hr_user.
*/
```

---

DCL statements are crucial for database security and access control, allowing administrators to manage who can access and manipulate data, ensuring data integrity and confidentiality within the database system.

## Transaction Control Language

Transaction Control Language (TCL) is a subset of SQL (Structured Query Language) used to manage transactions within a database. Transactions are sequences of one or more SQL operations treated as a single logical unit of work. TCL commands allow you to control the beginning and ending of transactions, as well as manage the changes made by transactions to the database.

In Oracle and other relational database management systems, TCL consists of the following commands:

---

### Commit

> This command is used to permanently save the changes made by the current transaction. Once a transaction is committed, its changes become visible to other transactions.

``` sql
COMMIT;
```

### Rollback

> This command is used to undo the changes made by the current transaction. It reverts the database to its state before the transaction began.

```sql
ROLLBACK;
```

### SAVEPOINT

> This command sets a named point within the current transaction to which you can later roll back. It allows you to create points within a transaction to which you can revert if necessary.

```sql
SAVEPOINT before_update;
```

### Set Transaction

> This command sets characteristics for the transaction, such as isolation level and other properties. It can also specify whether the transaction is read-only.

```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

---

TCL commands are essential for ensuring data consistency and integrity within the database by controlling when and how changes made by transactions are applied or undone. They help manage concurrent access to data and provide mechanisms to recover from errors or system failures affecting database operations.
