# Real Estate Data Cleaning & Transformation (MySQL)

## Project Overview
This project demonstrates an end-to-end data cleaning and transformation (ETL) pipeline using MySQL Workbench on a real estate dataset containing ~14,500 listings. The goal was to convert raw, unstructured text data into a structured, relational schema optimized for quantitative analysis.

## Tech Stack & Tools
- **Database:** MySQL 8.0
- **GUI Environment:** MySQL Workbench
- **Language:** SQL (DDL, DML, Regex)

## Key Cleaning Operations Executed
1. **Schema Standardization:** Standardized column names and assigned explicit data types.
2. **Numeric Price Extraction:** Converted raw price strings containing mixed units (`Cr`, `Lacs`, `k`) into uniform numerical values (`DECIMAL(15,2)` in INR) using `REGEXP_SUBSTR`.
3. **Feature Engineering:** 
   - Extracted bedroom counts (`bhk`) from listing titles and handled studio/RK edge cases.
   - Categorized property types (`Flat/Apartment`, `Independent House`, `Villa`, `Plot`) using conditional `CASE` logic.
   - Separated location strings into dedicated `locality` and `city` attributes.
   - Converted string flags (`balcony`) into binary integer formats (`1`/`0`).
4. **Data Hygiene:** Removed non-ASCII/corrupt characters, trimmed trailing spaces, backed missing bedroom values with bath counts, and dropped redundant text columns (`description`, `property_title`, `location`).

## Repository Structure
```text
├── Real Estate Data V21.csv    # Raw original dataset
├── real_estate(p1).sql         # Complete MySQL cleaning script
└── README.md                   # Project documentation
```                 # Project documentation
