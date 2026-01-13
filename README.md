# Data Cleaning & KPI Monitoring Dashboard

## Project Overview
This project focuses on data cleaning, validation, and KPI monitoring for a longitudinal dataset with recurring updates. The goal is to ensure data reliability over time while creating clear performance indicators that highlight changes, anomalies, and trends across reporting periods.

Rather than emphasizing prediction or modeling, this project is centered on data integrity, auditability, and stakeholder transparency. It demonstrates how analysts can:
- Detect unexpected data shifts
- Monitor revisions across time
- Communicate data quality changes clearly

This project showcases an end-to-end analytics workflow using SQL (BigQuery) for data preparation and Tableau for KPI-driven visualization.

---

## Dashboard Preview

<img width="980" height="821" alt="image" src="https://github.com/user-attachments/assets/a98ce201-5fa0-4656-93bf-1ebba78a1eff" />

---

## Dataset Context
The dataset represents periodic data releases in which values may be updated, revised, or corrected over time. Because historical records can change, traditional static analysis is insufficient.

This project treats the dataset as versioned over time, allowing for:
- Comparison between reporting snapshots
- Identification of material revisions
- Monitoring of stability vs volatility across periods

---

## Key KPIs
The dashboard highlights several core KPIs designed to surface meaningful changes in the data:

- Total records by reporting period
- Number of rows updated between snapshots
- Percent of dataset revised
- Net change in key metrics over time

Together, these KPIs provide both high-level monitoring and detailed insight into dataset health.

---

## Methodology

### Data Cleaning & Validation
- Raw data was ingested and standardized in BigQuery
- Inconsistent formats, missing values, and duplicates were addressed
- Reporting snapshots were preserved to enable period-over-period comparison

### KPI Construction
- KPIs were calculated using SQL aggregations and window functions
- SAFE_DIVIDE was used to ensure stability in percent-based metrics
- Tableau-ready views were created for visualization

All transformation logic and KPI calculations are documented in the /sql folder of this repository.

---

## Visualization
The Tableau dashboard was designed to prioritize clarity and auditability, featuring:

1. KPI Summary Tiles
   - High-level indicators of dataset change and stability
   - Designed for quick executive review

2. Trend Visualizations
   - Show how revisions and record counts evolve over time
   - Highlight anomalous reporting periods

3. Supporting Tables
   - Provide transparency into how KPI values were derived

This layout allows stakeholders to quickly assess data health while retaining access to underlying detail.

---

## Tools Used
- BigQuery (SQL)
- Tableau

---

## About Me
Harrison Nordstrom  
Data Analytics | Virginia Tech 2026  
Economics – College of Science  
nordstromharrison@gmail.com  

LinkedIn:
www.linkedin.com/in/nordstromharrison

This project is part of my data analytics portfolio and demonstrates my ability to design reliable data pipelines, construct meaningful KPIs, and communicate data quality insights effectively.

---

## Tableau Dashboard
[[ PLACEHOLDER FOR TABLEAU PUBLIC LINK ]](https://public.tableau.com/app/profile/harrison.nordstrom/viz/EmployeeDataCleaningKPI/Dashboard1?publish=yes)
