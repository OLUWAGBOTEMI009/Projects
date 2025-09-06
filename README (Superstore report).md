#  Superstore Profitability Analysis  

##  Project Overview  
This project explores the **Superstore dataset** to understand why profitability remains low despite strong sales.  
Using **SQL for data wrangling and exploratory analysis**, and **Power BI for visualization**, I identified key drivers of profit and loss, focusing on **discount practices, product performance, customer retention, and shipping efficiency**.  



##  Workflow  

### 1. Data Preparation (SQL)  
- Imported the dataset into PostgreSQL.  
- Checked for **null values**, **duplicates**, and **invalid ranges** (e.g., discount > 1).  
- Engineered new columns:  
  - `profit_margin = profit / sales`  
  - `shipping_duration = ship_date – order_date`  
  - Extracted `year, month, quarter, weekday` for time analysis.  

```sql
-- Create Superstore table
CREATE TABLE superstore (
    "Row ID" INTEGER,
    "Order ID" TEXT,
    "Order Date" DATE,
    "Ship Date" DATE,
    "Ship Mode" TEXT,
    "Customer ID" TEXT,
    "Customer Name" TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    "Postal Code" INTEGER,
    Region TEXT,
    "Product ID" TEXT,
    Category TEXT,
    "Sub-Category" TEXT,
    "Product Name" TEXT,
    Sales NUMERIC,
    Quantity INTEGER,
    Discount NUMERIC,
    Profit NUMERIC
);

-- Add derived columns
ALTER TABLE superstore
ADD COLUMN shipping_duration INTEGER,
ADD COLUMN profit_margin NUMERIC;

UPDATE superstore
SET shipping_duration = "Ship Date" - "Order Date",
    profit_margin = ROUND(profit / Sales, 4);
````

 



## 📊 Insights & Findings

### 1. Sales vs Profitability

Even with **\$2.30M in total sales**, overall profit is only **\$286.4K** (margin ≈ **12%**).

| Metric            | Value     |
| ----------------- | --------- |
| Total Sales       | \$2.30M   |
| Total Profit      | \$286.40K |
| Profit Margin (%) | 12%       |



### 2. Impact of Discounts

* Analysis showed a **negative correlation** between discounts and profit (`corr = -0.22`).
* High discount levels (>40%) often resulted in **loss-making orders**.

```sql
-- Correlation between discount and profit
SELECT CORR(Discount, Profit) AS discount_profit_correlation
FROM superstore;

-- Average profit per discount level
SELECT
    Discount,
    ROUND(AVG(Profit), 2) AS avg_profit,
    COUNT(*) AS num_orders
FROM superstore
GROUP BY Discount
ORDER BY Discount;
```

📉 *Visualization:*
[Profit Vs Discount]<img width="770" height="252" alt="image" src="https://github.com/user-attachments/assets/cc3d4ca3-a0b0-41eb-adbe-b9db44e87d04" />



### 3. Unprofitable Products

Certain products consistently generated **negative profit**, dragging down margins.

```sql
-- Identify products with negative total profit
SELECT
    "Product Name",
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 5;
```

| Product Name                                      | Total Profit (\$) |
| ------------------------------------------------- | ----------------- |
| 3.6 Cubic Foot Counter Height Office Refrigerator | -872.08           |
| 3D Systems Cube Printer, 2nd Gen                  | -468.00           |
| Acco Premium Plus Surge Suppressor                | -113.77           |
| Acco D-Ring Binder w/ DublLock                    | -102.84           |

⚠️ These products are **revenue drivers but not profit contributors**.



### 4. Profitability by Region & State

* Profitable: **California, New York, Washington, Michigan**.
* Loss-making: **Texas, Illinois, Ohio, Pennsylvania**.

```sql
-- Profitability by state and region
SELECT
    State,
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY State, Region
ORDER BY total_profit DESC;
```

📊 *Visualization:*
[Profit by State]<img width="1560" height="462" alt="image" src="https://github.com/user-attachments/assets/551255c0-0c22-4bc1-9786-3c1ff1849831" />



### 5. Customer Retention

* Only **\~30% of customers return** after their first order.
* However, retained customers generate **higher lifetime sales and profit**.

```sql
-- Retention rate
WITH customer_orders AS (
    SELECT "Customer ID", COUNT(DISTINCT "Order ID") AS num_orders
    FROM superstore
    GROUP BY "Customer ID"
)
SELECT
    ROUND(100.0 * SUM(CASE WHEN num_orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS retention_rate_percent
FROM customer_orders;
```

| Metric                        | Value |
| ----------------------------- | ----- |
| Retention Rate (%)            | \~30% |
| Avg Revenue per Customer (\$) | 1,893 |
| Avg Profit per Customer (\$)  | 236   |



### 6. Shipping Efficiency

* **Standard Class**: most cost-effective.
* **First-Class & Same-Day**: higher cost, not always translating into profit.
* Late shipments (>5 days) correlate with **lower average profit per order**.

```sql
-- Shipping mode efficiency
SELECT
    "Ship Mode",
    ROUND(AVG(shipping_duration), 2) AS avg_delivery_days,
    COUNT(*) AS num_orders,
    ROUND(AVG(Profit), 2) AS avg_profit
FROM superstore
GROUP BY "Ship Mode"
ORDER BY avg_delivery_days;
```

| Ship Mode      | Avg Delivery Days | Orders | Avg Profit (\$) |
| -------------- | ----------------- | ------ | --------------- |
| Standard Class | 4.7               | 5,000+ | 35.2            |
| First Class    | 2.2               | 1,200  | 18.6            |
| Same Day       | 0.9               | 900    | 10.2            |



##  Recommendations

1. **Discount Policy**

   * Cap discounts at **20% for Furniture**.
   * Apply **targeted promotions** only on high-margin products.

2. **Product Strategy**

   * Discontinue or renegotiate pricing for consistently unprofitable SKUs.

3. **Customer Retention**

   * Launch loyalty programs (points, personalized discounts).
   * Focus on converting first-time buyers into repeat customers.

4. **Shipping Optimization**

   * Promote **Standard Class** for cost savings.
   * Reserve premium shipping for high-value customers.



##  Tech Stack

* **SQL (PostgreSQL)** → Data wrangling & analysis.
* **Power BI** → Interactive dashboard & storytelling.
* **GitHub** → Version control & documentation.



##  Deliverables

*  SQL scripts for cleaning, transformations, and cohort analysis.
*  Power BI Dashboard:

  * KPI summary (Sales, Profit, Margin).
  * Discount vs Profit scatter.
  * Profit by State.
  * Loss-making products.
*  Case Study Report (this README).

---

 This project highlights how **analytics can uncover hidden profit drainers** and provide actionable recommendations for business growth.

```


