# Cafe Sales Data Cleaning

This repository contains a Jupyter Notebook for cleaning a dirty cafe sales dataset. The dataset includes transaction details such as items purchased, quantities, prices, payment methods, and locations.

## Overview

The original dataset (`dirty_cafe_sales.csv`) contained 10,000 rows with various data quality issues including:
- Missing values (NaN)
- Invalid entries like 'UNKNOWN' and 'ERROR'
- Incorrect data types
- Inconsistent values across columns

## Data Cleaning Process

### 1. Initial Data Assessment
- Dataset shape: 10,000 rows × 8 columns
- Identified missing values across all columns except 'Transaction ID'
- Found invalid entries ('UNKNOWN', 'ERROR') in multiple columns
- All columns were initially stored as object dtype instead of their appropriate types

### 2. Data Cleaning Steps

#### Handling Missing and Invalid Values
- Replaced 'UNKNOWN', 'ERROR', and NaN values with '0' across all columns
- Removed rows with invalid transaction dates

#### Populating Categorical Columns
- **Item Column**: Replaced zeros with 'Juice' (most frequent item)
- **Payment Method**: Replaced zeros with 'Digital Wallet' (most frequent method)
- **Location**: Replaced zeros with 'Takeaway' (most frequent location)

#### Data Type Conversion
- **Quantity**: Converted to int64
- **Price Per Unit**: Converted to float64
- **Total Spent**: Converted to float64 and renamed to 'Sales'
- **Transaction Date**: Converted to datetime

#### Value Imputation
- Replaced zero values in 'Quantity' and 'Price Per Unit' with the mean value of 3

#### Data Validation
- Recalculated 'Sales' column as `Quantity × Price Per Unit`
- Reset index for clean data structure

### 3. Final Dataset
- Cleaned dataset contains 9,540 rows
- All missing and invalid values have been addressed
- Appropriate data types assigned to each column
- Data is ready for analysis and visualization

## Files

- `Cafe_Data_Cleaning.ipynb`: Main Jupyter notebook with complete data cleaning process
- `dirty_cafe_sales.csv`: Original raw dataset (not included in this repository)
- `cafe_Cleaned_data.csv`: Cleaned dataset output

## Technologies Used

- Python
- Pandas
- Matplotlib

## Usage

1. Run the Jupyter notebook to reproduce the data cleaning process
2. The cleaned dataset can be used for further analysis, visualization, or machine learning projects

## Results

The cleaning process successfully transformed the dirty dataset into a clean, analysis-ready format with:
- Proper data types
- Consistent categorical values
- Accurate numerical calculations
- Valid transaction dates

The cleaned data is now suitable for exploring sales patterns, customer behavior, and business insights for the cafe.
