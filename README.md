# Real Estate Data Cleaning & Transformation (MySQL)

## Interactive Tableau Dashboard
[View the Live Tableau Dashboard Here] (https://public.tableau.com/app/profile/sayan.mitra2384/viz/ChennaiRealEstateDataAnalyticsDashboard/ChennaiRealEstateAnalyticsDashboard?publish=yes)

### Dashboard Snapshot
[Chennai Real Estate Dashboard] <img width="1828" height="770" alt="Chennai Real Estate Analytics Dashboard" src="https://github.com/user-attachments/assets/32e80dfc-1cf4-437d-9d83-510d19375eab" />

### Key Dashboard Insights
* **Top Localities:** Ekkatuthangal (₹24,170/sqft), SRI DEVI NEDIL (₹19,120/sqft), and Parthasarathy Puram (₹18,390/sqft) command the highest per-sqft rates.
* **Pricing by Type:** Independent Houses average ~₹1.61 Cr, Villas ~₹1.17 Cr, and Apartments ~₹65.1 Lakhs.
* **Inventory Distribution:** Market supply is heavily concentrated in 2 BHK configurations (174 of 295 listings).

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
```
