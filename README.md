PickMe Food Ordering & SQL Analytics 🍽
Project Overview
This project is a Flask-based food ordering system that allows users to place orders through a web UI. The data is stored in a MySQL database, and it includes SQL-based analytics to derive insights on order trends, customer behavior, and revenue generation.

Workflow
Place Orders 🍔 – Users select food items from the UI and place their orders.
Store Order Data 💾 – Orders, customers, and payments are saved in the MySQL database.
Analyze Data 📊 – Perform advanced SQL queries to extract insights and visualize data.


Project Structure

PickMe-Food-Ordering-Analytics
│── python
│   ├── app_index.py               # Flask web application for order processing  
│   ├── templates/                 # Contains UI files (e.g., index.html)  
│  
│── sql  
│   ├── database_schema.sql        # Defines table structure & constraints  
│   ├── analytics_queries/         
│   │   ├── basic_queries.sql      # Basic queries for data analysis  
│   │   ├── advanced_queries.sql   # Advanced queries for deeper insights  
│   │   ├── data_analysis.sql      # Queries to analyze customer behavior & trends  
│   │   ├── performance_tuning.sql # Optimizations including indexing and partitioning  
│   ├── ER_diagram_for_database_schema.png  # Database schema diagram  
│  
│── README.md                      # Project documentation  


Technologies Used
Flask 🐍 – Web framework for order processing
MySQL 🛢️ – Database storage & querying
SQL 📊 – Data analytics using advanced queries
HTML/CSS 🎨 – Web UI for placing orders


SQL Topics Covered
✅ Table Constraints (Primary Keys, Foreign Keys, Indexing)
✅ Aggregations (SUM, COUNT, AVG, MIN, MAX)
✅ Joins (INNER, LEFT, RIGHT)
✅ Window Functions (SUM OVER, RANK, ROW_NUMBER)
✅ CASE Statements (Conditional Data Categorization)
✅ Subqueries & CTEs (WITH Queries for Structured Analysis)
✅ Performance Tuning (Indexes, Partitions, Optimization)
✅ Regular Expressions (REGEXP) (Pattern Matching)


Note: This project integrates Flask for building the web-based ordering system and uses MySQL for storing orders and customer data. SQL queries are used for detailed analytics, making it easy to analyze trends and make data-driven decisions.
