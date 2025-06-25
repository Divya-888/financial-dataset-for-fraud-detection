# 💳 Financial Fraud Detection SQL Project

A real-world data analysis project using SQL to explore, analyze, and detect potential fraudulent activities in financial transactions. This case study is designed to strengthen SQL skills and simulate tasks often handled by Data Analysts in the finance and fintech sectors.

---

## 📌 Objective

The primary goal of this project is to:
- Analyze patterns in financial transactions
- Identify high-risk transactions and fraudulent behavior
- Practice and showcase SQL skills in a realistic business scenario

---

## 🧠 Key Skills Used

- SQL (MySQL-compatible syntax)
- Data Cleaning & Aggregation
- Window Functions & Subqueries
- CASE Statements & Logic Building
- Fraud Detection Logic

---

## 🗃️ Dataset Overview

The dataset used contains **financial transaction logs** and is inspired by [Kaggle's Synthetic Fraud Dataset](https://www.kaggle.com/datasets/).  
It includes over 6 million records with the following key fields:

| Column Name        | Description                                  |
|--------------------|----------------------------------------------|
| `step`             | Time step (hour)                             |
| `type`             | Type of transaction (e.g. CASH_OUT, TRANSFER)|
| `amount`           | Transaction amount                           |
| `nameOrig`         | Customer ID of sender                        |
| `oldbalanceOrg`    | Sender balance before transaction            |
| `newbalanceOrig`   | Sender balance after transaction             |
| `nameDest`         | Receiver ID                                  |
| `oldbalanceDest`   | Receiver balance before transaction          |
| `newbalanceDest`   | Receiver balance after transaction           |
| `isFraud`          | 1 if transaction is fraudulent, else 0       |
| `isFlaggedFraud`   | 1 if system flagged as fraud, else 0         |

---

## 🧪 Project Tasks

✔ Wrote and ran **20 real-world SQL queries** grouped into key learning areas:

| Slide | Focus Area               | Example Queries                                 |
|-------|--------------------------|--------------------------------------------------|
| 1     | Basic Querying           | Count transactions, Top 10 CASH_OUT             |
| 2     | Aggregation              | Total & average by type                         |
| 3     | Filtering & Conditions   | High-value transactions, conditional checks     |
| 4     | Fraud Insights           | Flagged fraud, pattern detection                |
| 5     | Grouping & HAVING        | Sender behavior, frequency counts               |
| 6     | Window Functions         | RANK, Running totals                            |
| 7     | Subqueries & CASE        | Top senders, Categorize amounts                 |
| 8     | Joins & Data Checks      | Join with user tables, balance mismatches       |

---


