# 🛍️ Retail Sales SQL Analysis

SQL • PostgreSQL • Data Analysis • EDA • Window Functions • CTEs • Business Analytics

A beginner-friendly SQL project that analyzes a retail sales dataset using **PostgreSQL** to answer real-world business questions through data exploration and business analysis.

> **Note:** This project started as a guided learning project. I extended it by solving additional business problems, writing alternative SQL solutions (CTEs, Subqueries, Window Functions), and focusing on understanding the logic behind every query rather than simply copying solutions.

---

# 📌 Project Overview

The objective of this project is to strengthen SQL fundamentals by working with a retail sales dataset and solving practical business problems commonly encountered in data analytics.

The project covers:

- Database creation
- Data cleaning
- Exploratory Data Analysis (EDA)
- Business insights using SQL
- Query optimization practice
- Advanced SQL concepts

---

# 🎯 Project Objectives

- Create a retail sales database
- Clean missing and inconsistent data
- Explore the dataset using SQL
- Solve business-oriented analytical questions
- Practice writing efficient SQL queries
- Learn SQL execution order
- Use Window Functions
- Use Common Table Expressions (CTEs)
- Practice Subqueries
- Improve SQL problem-solving skills

---

# 🛠️ Technologies Used

| Tool | Purpose |
|------|----------|
| PostgreSQL | Database |
| pgAdmin 4 | SQL IDE |
| SQL | Query Language |

---

# 🗄️ Database Schema

### Table: `retail_sales`

| Column | Description |
|---------|-------------|
| transaction_id | Unique transaction ID |
| sale_date | Date of sale |
| sale_time | Time of sale |
| customer_id | Customer ID |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Quantity purchased |
| price_per_unit | Price per unit |
| cogs | Cost of Goods Sold |
| total_sale | Total sale amount |

---

# 📂 Project Structure

```text
Retail_Sales_SQL_Analysis_P1/
│
├── dataset/
│   └── retail_sales.csv
│
├── sql/
│   └── retail_sales_analysis.sql
│
├── screenshots/
│   ├── output1.png
│   ├── output2.png
│   └── output3.png
│
└── README.md
```

---

# 🔄 Project Workflow

```text
Dataset
   │
   ▼
Database Creation
   │
   ▼
Data Cleaning
   │
   ▼
Exploratory Data Analysis
   │
   ▼
Business Questions
   │
   ▼
Advanced SQL Concepts
   │
   ▼
Business Insights
```

---

# 📚 SQL Concepts Practiced

### Data Definition Language (DDL)

- CREATE TABLE
- DROP TABLE

### Data Cleaning

- NULL value detection
- DELETE
- Data validation

### Data Exploration

- COUNT()
- COUNT(DISTINCT)
- DISTINCT

### Filtering

- WHERE
- BETWEEN
- Logical Operators
- Comparison Operators

### Aggregation

- SUM()
- AVG()
- COUNT()
- ROUND()

### Grouping

- GROUP BY
- HAVING

### Sorting

- ORDER BY
- LIMIT

### Conditional Logic

- CASE WHEN

### Date & Time Functions

- EXTRACT()
- LOWER()

### Window Functions

- RANK()
- PARTITION BY
- OVER()

### Advanced SQL

- Common Table Expressions (CTEs)
- Subqueries

---

# 📊 Business Questions Solved


This project answers the following business-oriented SQL questions:

1. Retrieve all sales made on **5th November 2022**.

2. Find all **Clothing** transactions where the quantity sold is greater than **4** during **November 2022**.

3. Calculate the **total sales** and **total number of orders** for each product category.

4. Find the **average age** of customers who purchased products from the **Beauty** category.

5. Identify all transactions where the **total sale amount exceeded ₹1000**.

6. Count the **total number of transactions** made by each **gender** within each product category.

7. Calculate the **average monthly sales** and identify the **best-selling month** in each year .

8. Find the **Top 5 customers** based on their total purchase amount.

9. Calculate the **number of unique customers** who purchased products from each category.

10. Classify transactions into **Morning, Afternoon, and Evening** shifts based on sale time and count the number of orders in each shift.

11. Identify product categories that generated **more than ₹300,000** in total sales.

12. Find the **product category with the highest total sales**.

13. Identify the **highest spending customer** in each product category .

14. Calculate the **gross sales, total cost, net profit, and profit margin percentage** for each product category.

---

# ⭐ Additional Practice Beyond the Guided Project

To deepen my understanding of SQL, I extended the original guided project by adding new analytical questions and implementing multiple approaches.

### Additional business questions

- Sales threshold analysis using HAVING
- Highest sales category
- Highest spending customer in each category
- Profit and Profit Margin analysis

### Multiple approaches practiced

- Simple Queries
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions

The focus was to understand **why a query works**, not just **how to write it**.

---

# 🎓 Learning Outcomes

After completing this project, I gained practical experience in:

- Writing clean and readable SQL queries
- Cleaning real-world datasets
- Performing Exploratory Data Analysis
- Solving business problems using SQL
- Using Window Functions
- Understanding SQL execution order
- Writing CTEs and Subqueries
- Debugging SQL queries

---

# 🙏 Acknowledgement

This project was completed as a **guided learning project**.

Rather than simply reproducing the instructor's solutions, I focused on understanding each concept, experimenting with alternative approaches, solving additional business questions, and documenting my learning throughout the project.

---

# 👨‍💻 Author

**Harish Kumar**

B.Tech Data Science & Engineering

IISER Bhopal

**GitHub:** https://github.com/Harish-kumar24130

**LinkedIn:** https://www.linkedin.com/in/harish-kumar-9189b8328/

---

⭐ If you found this project helpful, consider giving it a **Star** on GitHub.
