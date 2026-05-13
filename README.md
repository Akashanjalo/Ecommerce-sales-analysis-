# Ecommerce-sales-analysis-
# SQL Sales Analysis Project

## Project Overview
This project focuses on analyzing sales and customer data using SQL to extract meaningful business insights.  
The analysis covers revenue trends, customer behavior, product performance, and operational metrics using structured queries and database concepts.

---

## Objectives
- Analyze sales performance
- Identify top-performing products
- Understand customer purchasing behavior
- Generate business insights using SQL
- Practice real-world SQL problem solving

---

## Tools & Technologies
- SQL
- MySQL / PostgreSQL
- Excel
- Git & GitHub

---

## SQL Concepts Used
- SELECT Statements
- WHERE, GROUP BY, ORDER BY
- Aggregate Functions
- INNER JOIN / LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- CASE Statements
- Date Functions

---

## Database Structure

### Tables Used
1. customers
2. products
3. orders
4. order_items
5. payments

---

## Business Questions Solved

### Sales Analysis
- What are the top-selling products?
- Which category generates the highest revenue?
- What are the monthly sales trends?

### Customer Analysis
- Who are the top customers by revenue?
- Which customers place the most orders?
- What is the average customer spending?

### Product Analysis
- Which products have low sales?
- Which products contribute most to profits?

### Operational Insights
- Which payment method is used the most?
- What are the peak order periods?

---

## Project Structure

```text
SQL-Sales-Analysis/
│
├── datasets/
│
├── queries/
│   ├── basic_queries.sql
│   ├── intermediate_queries.sql
│   └── advanced_queries.sql
│
├── screenshots/
│
├── project.sql
│
└── README.md
```

---

## Sample SQL Query

```sql
SELECT 
    product_name,
    SUM(total_price) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## Key Insights
- Electronics category generated the highest revenue.
- Repeat customers contributed significantly to overall sales.
- Sales peaked during festive and holiday periods.
- Online payment methods were the most preferred.

---

## Learning Outcomes
Through this project, I improved my understanding of:
- Writing optimized SQL queries
- Database design concepts
- Data analysis techniques
- Business-oriented problem solving
- Data-driven decision making

---

## Future Improvements
- Build an interactive Power BI dashboard
- Add advanced KPI tracking
- Perform customer segmentation analysis
- Integrate Python for automation and visualization

---

## Author
Akash Anjalo

---

## Connect With Me
- GitHub: https://github.com/yourusername
- LinkedIn: https://linkedin.com/in/yourprofile
