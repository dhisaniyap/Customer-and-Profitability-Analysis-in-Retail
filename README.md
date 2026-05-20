Customer and Profitability Analysis in E-commerce

Project Overview:

This project focuses on analyzing e-commerce retail data using Python, SQL, and Power BI to understand customer behavior, product performance, sales trends, and profitability.

The main goal of this project is to find useful business insights that can help a retail company improve sales, reduce losses, and make better business decisions.

Business Problem:

Retail businesses handle thousands of sales transactions every day. Understanding which customers, products, and regions contribute the most revenue and profit is important for business growth.

This project aims to answer questions like:

* Which customer segments generate the most revenue?
* Which products are causing losses?
* How do discounts affect profitability?
* Which months generate the highest sales?
* Which regions perform the best?

Tools & Technologies Used:

* Python
* Pandas
* NumPy
* MySQL
* Power BI
* Pycharm

Dataset Information:

The dataset contains information related to:

* Customer segments
* Product categories and sub-categories
* Sales and profit
* Discounts
* Quantity sold
* Order dates
* Shipping details
* States and regions

Project Workflow:

Raw Dataset  
     ⬇  
Data Cleaning using Python  
     ⬇  
SQL Business Analysis  
     ⬇  
Power BI Dashboard  
     ⬇  
Business Insights


Data Cleaning & Preparation Using Python:

The dataset was cleaned and prepared using Python before analysis. 

Steps Performed:

1. Loaded dataset using pandas
2. Checked dataset structure and datatypes
3. Checked missing values
4. Renamed columns into snake_case format
5. Converted order date and ship date into datetime format
6. Created new columns such as:
   * year
   * shipping_days
   * ship_status
7. Removed unnecessary columns
8. Exported cleaned dataset into CSV
9. Uploaded cleaned data into MySQL

SQL Business Analysis:

Several business questions were analyzed using SQL queries.

Some Important Questions Solved

1. Which customer segments contribute the highest revenue?
2. Which products have high sales but low profit?
3. Which products generate repeated losses?
4. Which states generate the highest profit?
5. How do discounts affect profitability?
6. Which months have peak sales?
7. Which ship modes generate the highest profit?

Key Insights:

Customer Analysis:

* Consumer customers contribute the highest revenue and profit.
* Customers from the Consumer segment purchase more frequently than other segments.

Product Analysis:

* Technology products generate the highest sales revenue.
* Tables, Machines, Bookcases, and Supplies generate good sales but low profit.
* Binders generate repeated losses because of heavy discounts.

Regional Analysis:

* California and New York generate the highest revenue and profits.
* The West region performs better compared to other regions.

Sales Trend Analysis:

* Sales increase during the last few months of the year, especially in September, November, and December.
* Festival seasons and holiday shopping may be one of the reasons for higher sales during these months.

Discount Analysis:

* Higher discounts reduce profitability and increase business losses.
* Heavy discounts negatively affect products like Binders and Machines.

Power BI Dashboard:

An interactive Power BI dashboard was created to visualize the analysis and business insights.

Dashboard Pages:

1. Overview Dashboard
2. Regional Analysis
3. Customer Trends

Conclusion:

This project helped in understanding customer purchasing behavior, product profitability, regional sales performance, and discount impact using real-world retail data.

By combining Python, SQL, and Power BI, the project demonstrates a complete data analytics workflow starting from data cleaning to dashboard creation and business insight generation.

The insights from this project can help businesses improve profitability, reduce losses, and make better strategic decisions.
