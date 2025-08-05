CREATE DATABASE Logistics;
USE Logistics;

-- Confirm the table
SELECT* FROM train;
 
 -- DELIVERY PERFORMANCE
 -- What percentage of orders were delivered on time vs late
 SELECT 
	Reached_on_Time,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*)/(SELECT COUNT(*) FROM train) *100, 2) AS Percentage
    FROM train
    GROUP BY Reached_on_Time;
    
    -- Which warehouse block has the highest rate of late deliveries
    SELECT
		Warehouse_block,
        COUNT(*) AS late_deliveries
	FROM train
    WHERE Reached_on_Time = 0
    GROUP BY Warehouse_block
    ORDER BY Warehouse_block;
    
    -- Does the mode of shipment affect on-time delivery?
    SELECT 
		Mode_of_Shipment,
        SUM(CASE WHEN Reached_on_Time = 1 THEN 1 ELSE 0 END) AS On_time,
        SUM( CASE WHEN Reached_on_Time = 0 THEN 1 ELSE 0 END ) AS late
	FROM train
    GROUP BY Mode_of_Shipment;
    
    -- What is the average delivery time rating by customer rating levels?

SELECT 
Customer_rating,
AVG( CASE WHEN 	Reached_on_Time = 1 THEN 1 ELSE 0 END)* 100 AS PCT
FROM train
GROUP BY Customer_rating 
ORDER BY PCT;

-- CUSTOMER BEHAVIOR AND EXPERIENCE
-- Do customers with more prior purchases receive better service (on-time delivery)?
SELECT
	Prior_purchases,
    AVG( CASE WHEN 	Reached_on_Time = 1 THEN 1 ELSE 0 END)* 100 AS PCT
FROM train
GROUP BY Prior_purchases
ORDER BY Prior_purchases;

-- Is there a correlation between the number of customer care calls and late deliveries?
SELECT 
Customer_care_calls,
SUM(CASE WHEN Reached_on_Time = 0 THEN 1 ELSE 0 END) AS late_deliveries 
FROM train
GROUP BY Customer_care_calls
ORDER BY Customer_care_calls;

-- How does customer rating vary across different product importance levels?
SELECT 
	Product_importance,
    ROUND(AVG(Customer_rating), 2) AS avg_rating
FROM train
GROUP BY Product_importance;

-- COST, DISCOUNTS, AND REVENUE
-- What is the average cost of products by warehouse block?
SELECT 
	Warehouse_block,
    AVG(Cost_of_the_Product) AS avg_product_cost
FROM train
GROUP BY Warehouse_block
ORDER BY avg_product_cost;

-- Which mode of shipment is associated with the highest product cost?
SELECT
Mode_of_Shipment,
ROUND( AVG(Cost_of_the_Product), 2) AS avg_product_cost
FROM train
GROUP BY Mode_of_Shipment
ORDER BY avg_product_cost;
 
 -- Do higher discounts increase the chances of late delivery?
SELECT
	Discount_offered,
    SUM(CASE WHEN Reached_on_Time = 0 THEN 1 ELSE 0 END ) AS Late_deliveries
FROM train
GROUP BY Discount_offered
ORDER BY Discount_offered;

-- OPERATIONAL EFFICIENCY
 -- Which warehouse handles the heaviest shipments on average?
SELECT
	Warehouse_block,
    AVG(Weight_in_gms) AS avg_weight
FROM train
GROUP BY Warehouse_block
ORDER BY avg_weight DESC;

-- What is the average discount offered by product importance?
SELECT
	Product_importance,
    AVG(Discount_offered) AS avg_discount
FROM train
GROUP BY Product_importance;

-- Do male or female customers receive products more on time?
SELECT 
	Gender, 
    SUM(CASE WHEN Reached_on_Time  = 1 THEN 1 ELSE 0 END) AS On_time_deliveries,
    SUM(CASE WHEN Reached_on_Time  = 0 THEN 1 ELSE 0 END) AS late_deliveries
FROM train
GROUP BY Gender;

 -- Which combination of warehouse and shipment mode handles the highest average product cost ?
 SELECT
	Warehouse_block, 
    Mode_of_Shipment,
    ROUND(AVG(Cost_of_the_Product), 2) AS avg_cost
FROM train
GROUP BY Warehouse_block, Mode_of_Shipment
ORDER BY avg_cost DESC;
    
	
 
