## Optimizing Logistics Operations with Power BI and SQL: A Data-Driven Dashboard for Delivery Performance

### Introduction
Late deliveries and inefficient logistics can cost companies millions annually in delays, lost trust, and operational waste. This project uses Power BI and SQL to analyze a logistics dataset and uncover inefficiencies across shipment modes, warehouse operations, and product handling. By simulating delivery dates and engineering key metrics, we built an interactive dashboard to monitor and optimize logistics performance.

### Problem Statement
How can a logistics company improve delivery performance and operational efficiency without a formal delivery tracking system in place?
The dataset lacked a date field and required significant cleaning before time-based and trend analyses could be performed. Our analysis addresses:

- Which shipment modes and warehouse blocks are causing the most delays?

- How do product features (e.g., weight, cost, discount) influence delivery outcomes?

- Where are the inefficiencies in the logistics chain?

### Analysis Approach
To explore and answer these questions, we:

- Simulated a continuous Order_Date column between Jan 2024 and May 2025 using DAX.

- Grouped and analyzed data across key dimensions: Mode_of_Shipment, Warehouse_Block, Product priority and Date table, etc.

- Built a 4-page Power BI dashboard with thematic sections: Shipment Performance, Warehouse/Product Efficiency, and Customer/Location Insights.

- Applied SQL queries for pre-aggregation, filtering, and performance optimization.

### Data Description
- Source: Sample logistics dataset (no dates originally)

- Size: 10,999 rows

- Fields include:

Mode_of_Shipment, Customer_Care_Calls, Cost_of_the_Product

Discount_offered, Weight_in_gms, Reached_on_Time_Y_N

Warehouse_block, Product_importance, Gender, Customer_rating, etc.

##### - Note:
The dataset originally lacked date or time information. A continuous Order_Date was generated using an indexed cycling method to simulate time-series patterns.

### Tools & Technologies
- SQL (MySQL 8+) – Data transformation and advanced queries

- Power BI – Dashboard creation, time-series visuals, KPI cards

- DAX – For calculated columns and time-based metrics

- Power Query – Index generation and custom transformations

### Data Preparation & Modeling
  - Added a continuous Order_Date using DAX and an existing Index_ID column:
    '''
    Order_date = 
            VAR StartDate = DATE(2024, 1,1)
            VAR TotalDays = DATEDIFF(StartDate, DATE(2025, 6, 30), DAY)+1
            RETURN
            StartDate + MOD('Train'[ID], TotalDays)
    '''
- Modeled data using a flat table format for performance; time dimension added for trend analysis.

### Dashboard Overview
##### Page 1: Performance Overview
- Delivery timeliness by shipment mode.
- Delivery trends.
- Delivery timeliness by product priority.
  <img width="890" height="508" alt="Transport   Logistics part 1" src="https://github.com/user-attachments/assets/80bdd3d6-a2fb-40bb-a5c9-4fd6672f41bb" />
##### Page 2: Warehouse efficiency
- Delivery timeliness by warehouse block.
- Delivery timeliness by warehouse block and mode of shipment.
  <img width="888" height="500" alt="Transport   Logistics part 2" src="https://github.com/user-attachments/assets/e6eeffeb-fb65-4ed4-8658-eadeb57df738" />
##### Page 3: Cost & Discounts
- Average cost of products by shipment mode.
- Average discount offered by product priority.
- Average cost of products by warehouse block.
  <img width="887" height="497" alt="Transport   Logistics part 3" src="https://github.com/user-attachments/assets/81e1c0ae-e17e-4fa1-9196-828436ca6c76" />
##### Page 4: Customer behavior
- Customer rating by warehouse block.
- Customer rating by mode of shipment.
- Customer calls trends.
  <img width="888" height="502" alt="Transport   Logistics part 4" src="https://github.com/user-attachments/assets/f4a5cb70-6e0d-4507-b909-766246f3f504" />

### Key Insights
-  Road shipment had the lowest on-time delivery rate compared to air and ship.
-  Certain warehouse blocks consistently had higher late deliveries, indicating bottlenecks. Block F, in particular was bleeding money through discounts and late deliveries.
-  Delivery delays peaked periodically across the simulated timeline, showing a potential need for seasonal staffing adjustments.
-  Flight was the most consistent mode of transport yet underutilized for valuable products.

### Recommendation
- Audit low-performing warehouses for staffing, process, or equipment issues.
- Shift volume to more efficient shipment modes where possible.
- Implement real delivery timestamps going forward to replace the simulated date logic.
- Automate tasks, like sending SMS to reduce customer care calls.

### Conclusion
This logistics dashboard empowers operations teams to make data-driven decisions that improve delivery performance. By engineering a time dimension and layering insights across mode, warehouse, product, and location, we simulate a real-world logistics monitoring solution. Future improvements could include integrating real-time GPS tracking and actual delivery timestamps for even more granular analysis.

### Resources & References
For the interactive dashboard, [Click HERE](https://app.powerbi.com/view?r=eyJrIjoiZTAwNTQ2NjktYzQ3YS00NjE4LWJiZGMtZDFhYTNlM2UzN2Q4IiwidCI6IjZmMWE1ZTFhLWVkY2EtNGJjYy1iMmMwLWY4MGE4OTM3MzE2NiJ9)







