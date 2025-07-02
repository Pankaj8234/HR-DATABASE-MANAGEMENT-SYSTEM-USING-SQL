# HR Database Management System

A comprehensive SQL-based project simulating an HR (Human Resources) system using structured queries on a relational database. This project is ideal for learning SQL fundamentals including DDL, DML, joins, subqueries, and advanced operators.

---

## 📌 Project Overview

The HR Database contains 7 interlinked tables:
- `employees`
- `jobs`
- `departments`
- `dependents`
- `locations`
- `countries`
- `regions`

It also includes additional entities like `projects`, `project_milestones`, `courses`, etc., to explore foreign key relationships, alterations, and advanced querying.

---

## 🗃️ Schema & Data

- Tables are created using standard SQL DDL commands.
- Data is populated using realistic INSERT statements.
- Constraints such as primary keys and foreign keys are implemented.

---

## 🔍 Features & Topics Covered

- **DDL & DML**: Table creation and data insertion
- **SELECT Statements**: Basic to advanced queries
- **WHERE, ORDER BY, DISTINCT, BETWEEN, IN, LIKE**
- **Aggregate Functions**: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- **GROUP BY / HAVING**
- **JOINS**: INNER JOIN, LEFT JOIN, SELF JOIN, FULL OUTER JOIN
- **SUBQUERIES**: Scalar, correlated and nested queries
- **ALTER TABLE**: Add, drop and modify columns
- **SQL CASE Expression**
- **Set Operators**: UNION, INTERSECT
- **Data Constraints**: PRIMARY KEY, FOREIGN KEY

---

## 🛠️ How to Use

1. Clone this repo.
2. Run the scripts in the following order:
   - `/database/create_tables.sql`
   - `/database/insert_data.sql`
3. Explore queries under the `/queries/` folder using SQL Server or your preferred RDBMS.

---

## 💡 Sample Query

```sql
-- Get all employees with salary above average
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

---

## 🧠 Learning Outcomes

- Understand relational schema design
- Build and query normalized databases
- Learn foreign key constraints and referential integrity
- Practice real-world SQL scenarios with HR data

---

## 📂 Folder Structure

```
HR-Database-Management-System/
│
├── database/
├── queries/
└── README.md
```

---

## 📜 License

This project is licensed under the MIT License. You can freely use and adapt it.

---

## 👨‍💻 Author

Aditya Tiwari  
**Email**: _[your_email]_  
**LinkedIn**: [linkedin.com/in/adityatiwari](https://linkedin.com/in/adityatiwari)

---

## ⭐ GitHub

If you find this helpful, consider giving it a ⭐ on [GitHub](https://github.com).
