# Online Shopping Management System

A MySQL-based database project for managing and analyzing the core data
of an online shopping business. The project focuses on relational
database relationships, data integrity, and business analysis using SQL
queries.

## Project Overview

The database is named `online_shopping` and works with five business
entities:

-   **Customers** -- customer details and city information
-   **Categories** -- product category information
-   **Products** -- product details, prices, category references, and
    stock
-   **Orders** -- customer orders and order dates
-   **OrderDetails** -- products and quantities included in orders

The project uses SQL to explore customer orders, product performance,
sales revenue, and category-level results. It also includes examples of
a stored procedure and a trigger.

## Technology Used

-   **Database:** MySQL
-   **Database client:** MySQL Workbench
-   **Query language:** SQL

## Database Relationships

The supplied constraint script defines these relationships:

  Child table      Foreign key     Referenced table
  ---------------- --------------- ---------------------------
  `products`       `category_id`   `categories(category_id)`
  `orders`         `customer_id`   `customers(customer_id)`
  `orderdetails`   `order_id`      `orders(order_id)`
  `orderdetails`   `product_id`    `products(product_id)`

Each of the five tables is assigned a primary key in
`02_Add_Constraint.sql`.

## SQL Concepts Demonstrated

-   Database selection and table inspection
-   Primary key and foreign key constraints
-   `INNER JOIN` and `LEFT JOIN`
-   Filtering with `WHERE`
-   Grouping and sorting with `GROUP BY` and `ORDER BY`
-   Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
-   Subqueries and `HAVING`
-   Stored procedure creation and calling
-   Trigger creation and use of `NEW` values
-   Window functions with `RANK()`
-   Date functions such as `YEAR()` and `MONTH()`

## Business Questions and Analysis

The analysis script contains queries intended to answer questions such
as:

1.  Display products with their category names.
2.  Find products priced above ₹1,000.
3.  List customers from Nagpur.
4.  Count orders placed by each customer.
5.  Calculate total quantity sold for each product.
6.  Identify the top-selling product by quantity.
7.  Find the customer with the highest calculated spend.
8.  Find products priced above the average product price.
9.  Find customers whose order counts are above the average.
10. Retrieve orders for a customer using a stored procedure.
11. Reduce product stock when an order-detail row is inserted.
12. Rank products by calculated revenue.
13. Calculate monthly sales.
14. Count customers city-wise.
15. Calculate revenue category-wise.
16. Identify products that have never been ordered.
17. Calculate total company revenue.

Revenue calculations in the supplied queries use
`product price × order quantity`.

## Project Files

  -----------------------------------------------------------------------
  File                                Purpose
  ----------------------------------- -----------------------------------
  `01_create_database.sql`            Creates and selects the
                                      `online_shopping` database and
                                      checks the project tables

  `02_Add_Constraint.sql`             Adds primary key and foreign key
                                      constraints

  `03_problem_solve.sql`              Contains business analysis queries,
                                      a stored procedure, and a
                                      stock-update trigger
  -----------------------------------------------------------------------

## How to Run

1.  Open MySQL Workbench and connect to your MySQL server.
2.  Run `01_create_database.sql` to create and select the database.
3.  Make sure the five tables (`customers`, `categories`, `products`,
    `orders`, and `orderdetails`) have been created and populated.
4.  Run `02_Add_Constraint.sql` to add the primary and foreign key
    constraints.
5.  Run `03_problem_solve.sql` to execute the analysis queries and
    database-programming examples.

> **Note:** The supplied `01_create_database.sql` file creates the
> database but does not contain the `CREATE TABLE` statements or sample
> data. Those must be available in the database before running the
> constraint and analysis scripts.

## Future Enhancement

-   Connect the MySQL database to **Microsoft Power BI**.
-   Build interactive dashboards for sales, revenue, customers,
    products, and categories.
-   Track business KPIs and trends through visual reports.

## Learning Outcomes

This project provides practical experience in relational database
concepts, SQL querying, table relationships, business data analysis, and
introductory database programming with stored procedures and triggers.

------------------------------------------------------------------------

**Project:** Online Shopping Management System\
**Current implementation:** MySQL and SQL\
**Planned enhancement:** Microsoft Power BI
