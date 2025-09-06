CREATE TABLE
    superstore (
        "Row ID" INTEGER,
        "Order ID" TEXT,
        "Order Date" DATE,
        "Ship Date" DATE,
        "Ship Mode" TEXT,
        "Customer ID" text,
        "Customer Name" text,
        Segment text,
        Country text,
        City text,
        State text,
        "Postal Code" INTEGER,
        Region text,
        "Product ID" text,
        Category text,
        "Sub-Category" text,
        "Product Name" text,
        Sales NUMERIC,
        Quantity INTEGER,
        Discount NUMERIC,
        Profit NUMERIC
    );

COPY superstore
FROM
    'C:\Users\USER\Downloads\Data Case study\Superstore.csv' DELIMITER ',' CSV HEADER ENCODING 'ISO-8859-1';

SET
    DateStyle = 'ISO, DMY';

SELECT
    *
FROM
    superstore
LIMIT
    10;

-- Check for null values in each column
SELECT
    SUM(
        CASE
            WHEN "Row ID" IS NULL THEN 1
            ELSE 0
        END
    ) AS row_id_nulls,
    SUM(
        CASE
            WHEN "Order ID" IS NULL THEN 1
            ELSE 0
        END
    ) AS order_id_nulls,
    SUM(
        CASE
            WHEN "Order Date" IS NULL THEN 1
            ELSE 0
        END
    ) AS order_date_nulls,
    SUM(
        CASE
            WHEN "Ship Date" IS NULL THEN 1
            ELSE 0
        END
    ) AS ship_date_nulls,
    SUM(
        CASE
            WHEN "Ship Mode" IS NULL THEN 1
            ELSE 0
        END
    ) AS ship_mode_nulls,
    SUM(
        CASE
            WHEN "Customer ID" IS NULL THEN 1
            ELSE 0
        END
    ) AS customer_id_nulls,
    SUM(
        CASE
            WHEN "Customer Name" IS NULL THEN 1
            ELSE 0
        END
    ) AS customer_name_nulls,
    SUM(
        CASE
            WHEN Segment IS NULL THEN 1
            ELSE 0
        END
    ) AS segment_nulls,
    SUM(
        CASE
            WHEN Country IS NULL THEN 1
            ELSE 0
        END
    ) AS country_nulls,
    SUM(
        CASE
            WHEN City IS NULL THEN 1
            ELSE 0
        END
    ) AS city_nulls,
    SUM(
        CASE
            WHEN State IS NULL THEN 1
            ELSE 0
        END
    ) AS state_nulls,
    SUM(
        CASE
            WHEN "Postal Code" IS NULL THEN 1
            ELSE 0
        END
    ) AS postal_code_nulls,
    SUM(
        CASE
            WHEN Region IS NULL THEN 1
            ELSE 0
        END
    ) AS region_nulls,
    SUM(
        CASE
            WHEN "Product ID" IS NULL THEN 1
            ELSE 0
        END
    ) AS product_id_nulls,
    SUM(
        CASE
            WHEN Category IS NULL THEN 1
            ELSE 0
        END
    ) AS category_nulls,
    SUM(
        CASE
            WHEN "Sub-Category" IS NULL THEN 1
            ELSE 0
        END
    ) AS sub_category_nulls,
    SUM(
        CASE
            WHEN "Product Name" IS NULL THEN 1
            ELSE 0
        END
    ) AS product_name_nulls,
    SUM(
        CASE
            WHEN Sales IS NULL THEN 1
            ELSE 0
        END
    ) AS sales_nulls,
    SUM(
        CASE
            WHEN Quantity IS NULL THEN 1
            ELSE 0
        END
    ) AS quantity_nulls,
    SUM(
        CASE
            WHEN Discount IS NULL THEN 1
            ELSE 0
        END
    ) AS discount_nulls,
    SUM(
        CASE
            WHEN Profit IS NULL THEN 1
            ELSE 0
        END
    ) AS profit_nulls
FROM
    superstore;

-- There are no null values in any column
-- Check for duplicate rows based on "Order ID"
SELECT DISTINCT
    "Order ID",
    COUNT(*) AS count
FROM
    superstore
GROUP BY
    "Order ID"
HAVING
    COUNT(*) > 1;

SELECT DISTINCT
    "Customer ID",
    COUNT(*) AS count
FROM
    superstore
GROUP BY
    "Customer ID"
HAVING
    COUNT(*) > 1;

-- Check for completely duplicate rows (all columns identical)
SELECT
    *,
    COUNT(*) AS duplicate_count
FROM
    superstore
GROUP BY
    "Row ID",
    "Order ID",
    "Order Date",
    "Ship Date",
    "Ship Mode",
    "Customer ID",
    "Customer Name",
    Segment,
    Country,
    City,
    State,
    "Postal Code",
    Region,
    "Product ID",
    Category,
    "Sub-Category",
    "Product Name",
    Sales,
    Quantity,
    Discount,
    Profit
HAVING
    COUNT(*) > 1;

-- There are no duplicates
SELECT DISTINCT
    "Ship Mode"
FROM
    superstore
SELECT DISTINCT
    "Sub-Category"
FROM
    superstore
    -- check for negative values in Sales, Quantity, Discount, and Profit
SELECT
    sales
FROM
    superstore
where
    sales < 0;

SELECT
    quantity
FROM
    superstore
where
    quantity < 0;

SELECT
    discount
FROM
    superstore
where
    discount > 1
    OR discount < 0;

SELECT
    profit
FROM
    superstore
where
    profit < 0;

-- create a new column shipping_duration to store the difference between Ship Date and Order Date
ALTER TABLE superstore
ADD COLUMN shipping_duration INTEGER;

-- Calculate the shipping duration in days and update the new column
UPDATE superstore
SET
    shipping_duration = "Ship Date" - "Order Date";

-- Calculate profit margin and create a new column profit_margin to store the result
ALTER TABLE superstore
ADD COLUMN profit_margin NUMERIC;

UPDATE superstore
SET
    profit_margin = ROUND(profit / Sales, 4);

-- Create a Date table for time-based analysis
-- Add columns for date parts
ALTER TABLE superstore
ADD COLUMN order_year INTEGER,
ADD COLUMN order_month INTEGER,
ADD COLUMN order_day INTEGER,
ADD COLUMN order_month_name TEXT,
ADD COLUMN order_day_name TEXT,
ADD COLUMN order_quarter INTEGER;

-- Update the new columns with extracted date parts
UPDATE superstore
SET
    order_year = EXTRACT(
        YEAR
        FROM
            "Order Date"
    ),
    order_month = EXTRACT(
        MONTH
        FROM
            "Order Date"
    ),
    order_day = EXTRACT(
        DAY
        FROM
            "Order Date"
    ),
    order_month_name = TO_CHAR ("Order Date", 'Month'),
    order_day_name = TO_CHAR ("Order Date", 'Day'),
    order_quarter = EXTRACT(
        QUARTER
        FROM
            "Order Date"
    );

-- Exploratory Data Analysis (EDA) Queries
-- 1. Find top-performing categories and regions by total sales and profit
SELECT
    Category,
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM
    superstore
GROUP BY
    Category,
    Region
ORDER BY
    total_sales DESC,
    total_profit DESC;

-- 2. Identify loss-making products (negative profit)
SELECT
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category",
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales,
    COUNT(*) AS num_orders
FROM
    superstore
GROUP BY
    "Product ID",
    "Product Name",
    Category,
    "Sub-Category"
HAVING
    SUM(Profit) < 0
ORDER BY
    total_profit ASC;

-- 3. Analyze the relationship between discount and profit
SELECT
    Discount,
    ROUND(AVG(Profit), 4) AS avg_profit,
    COUNT(*) AS num_orders
FROM
    superstore
GROUP BY
    Discount
ORDER BY
    Discount;

-- Optional: Simple linear regression (correlation) between discount and profit
SELECT
    CORR(Discount, Profit) AS discount_profit_correlation
FROM
    superstore;

-- Customer Segmentation
-- Group customers into segments and count the number of customers in each segment
SELECT
    segment,
    COUNT(DISTINCT "Customer ID") AS num_customers
FROM
    superstore
GROUP BY
    segment
ORDER BY
    num_customers DESC;

-- Cohort Analysis: Track repeat purchases by customer acquisition month
-- Step 1: Find each customer's first order month (acquisition month)
WITH
    customer_acquisition AS (
        SELECT
            "Customer ID",
            MIN(DATE_TRUNC ('month', "Order Date")) AS acquisition_month
        FROM
            superstore
        GROUP BY
            "Customer ID"
    ),
    -- Step 2: Attach acquisition month to each order
    orders_with_cohort AS (
        SELECT
            s.*,
            ca.acquisition_month
        FROM
            superstore AS s
            JOIN customer_acquisition AS ca ON s."Customer ID" = ca."Customer ID"
    ),
    -- Step 3: Calculate order month and cohort period (months since acquisition)
    orders_with_period AS (
        SELECT
            "Customer ID",
            acquisition_month,
            DATE_TRUNC ('month', "Order Date") AS order_month,
            EXTRACT(
                YEAR
                FROM
                    DATE_TRUNC ('month', "Order Date")
            ) * 12 + EXTRACT(
                MONTH
                FROM
                    DATE_TRUNC ('month', "Order Date")
            ) - (
                EXTRACT(
                    YEAR
                    FROM
                        acquisition_month
                ) * 12 + EXTRACT(
                    MONTH
                    FROM
                        acquisition_month
                )
            ) AS cohort_period
        FROM
            orders_with_cohort
    )
    -- Step 4: Aggregate repeat purchases by cohort and period
SELECT
    acquisition_month,
    cohort_period,
    COUNT(DISTINCT "Customer ID") AS num_customers,
    COUNT(*) AS num_orders
FROM
    orders_with_period
GROUP BY
    acquisition_month,
    cohort_period
ORDER BY
    acquisition_month,
    cohort_period;

-- Customer Lifetime Value (CLV): total profit per customer
SELECT
    "Customer ID",
    "Customer Name",
    SUM(Profit) AS customer_lifetime_profit,
    SUM(Sales) AS customer_lifetime_sales,
    COUNT(DISTINCT "Order ID") AS total_orders
FROM
    superstore
GROUP BY
    "Customer ID",
    "Customer Name"
ORDER BY
    customer_lifetime_profit DESC;

-- Retention Rate: percentage of customers with more than one order
WITH
    customer_orders AS (
        SELECT
            "Customer ID",
            COUNT(DISTINCT "Order ID") AS num_orders
        FROM
            superstore
        GROUP BY
            "Customer ID"
    )
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN num_orders > 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS retention_rate_percent
FROM
    customer_orders;

-- Average Revenue per Customer: total sales divided by number of unique customers
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT "Customer ID"), 2) AS avg_revenue_per_customer
FROM
    superstore;

-- Shipping Efficiency: Compare Ship Mode vs. average delivery time
SELECT
    "Ship Mode",
    ROUND(AVG(shipping_duration), 2) AS avg_delivery_days,
    COUNT(*) AS num_orders
FROM
    superstore
GROUP BY
    "Ship Mode"
ORDER BY
    avg_delivery_days;

-- Analyze late shipments impact on profit
-- Define late shipment as shipping_duration > 5 days (adjust threshold as needed)
SELECT
    CASE
        WHEN shipping_duration > 5 THEN 'Late'
        ELSE 'On Time'
    END AS shipment_status,
    COUNT(*) AS num_orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit), 2) AS total_profit
FROM
    superstore
GROUP BY
    shipment_status;

-- View the final structure of the superstore table
SELECT
    *
FROM
    superstore;