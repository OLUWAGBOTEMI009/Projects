# Telco Customer Churn Analysis

## Project Goal
The goal of this project is to analyze customer churn for a telecommunications company, identify key drivers of churn, and provide actionable recommendations to reduce churn. The analysis focuses on understanding how contract type, tenure, internet service type, and monthly charges impact customer retention.

## Dataset Source
The dataset used is the **IBM Telco Customer Churn** dataset, publicly available on Kaggle and IBM’s GitHub repository.  
File: `WA_Fn-UseC_-Telco-Customer-Churn.csv`  
It contains 7,043 customer records with 21 features including demographics, account information, services subscribed, and churn status.

## Key Findings

1. **Contract type is the strongest predictor of churn**  
   - Month‑to‑month contracts have a churn rate of **42.7%**, compared to 11.3% for one‑year contracts and 2.8% for two‑year contracts.  
   *Recommendation:* Offer month‑to‑month customers incentives to switch to annual contracts.

2. **Early tenure is the danger zone**  
   - **55.5%** of churned customers left within the first 12 months.  
   *Recommendation:* Launch an onboarding retention program for customers in months 1–6.

3. **Fiber optic + month‑to‑month = highest risk segment**  
   - This segment has a churn rate of **54.6%** and an average monthly charge of $87.02, which is lower than longer‑term fiber optic customers.  
   *Recommendation:* Investigate service quality or price sensitivity; proactively reach out before month 3.

## Best Chart

Below is the histogram showing the distribution of customer tenure by churn status. It clearly illustrates that churned customers (orange) are heavily concentrated in the first 12 months.

<img width="1200" height="750" alt="churn_by_tenure" src="https://github.com/user-attachments/assets/99fd7980-6845-4824-87f5-e0bbfcc52d64" />




## Business Impact Estimate
Reducing churn by 5 percentage points in the highest‑risk segment (month‑to‑month + fiber optic) would retain approximately 106 additional customers, generating roughly **$111,000** in annual revenue (based on $87.02 average monthly charge × 12).

## Usage
Run the Jupyter notebook `Telco Customer Churn Analysis.ipynb` to reproduce the analysis, visualizations, and findings.
