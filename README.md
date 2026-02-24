## Overview
This project implements an end-to-end ELT analytics pipeline for Airbnb-style data using S3 → Snowflake → dbt, following a Medallion Architecture and modeling -- Raw --> fact+dim --> analytics mart.

Compared to the previous [Airbnb project](https://github.com/zz1237/AirbnbProject), this implementation focuses on advanced dbt engineering practices, including unit testing, model contracts, data quality tests with external expectations package, hooks, and automated documentation.

The goal is to demonstrate production-grade analytics engineering patterns beyond basic transformations.

## Tech Stack
- Warehous: Snowflake
- Transformation: dbt
- Language: SQL (Jinja)
- Configuration: Python (uv)
- Version Control: Git/Github

## Data Architechture
### 1. Source & Staging
Raw data is loaded from S3 into Snowflake staging tables:
- airbnb.listings
- airbnb.reviews
- airbnb.hosts

Light transformations standardize raw inputs:
- src_listings
- src_reviews
- src_hosts

Responsibilities:
- Column renaming
- Type casting
- Basic normalization
- Source-level testing

### 2. fact + dim tables
Business-ready dimensions are derived from staging and Transactional grain is modeled in fact table:
- fct_reviews
- dim_listings_clean
- dim_hosts_clean

Slowly Changing Dimension handling is implemented as well.

### 3. Analytical Mart
Built analytical mart for full moon analysis purpose.

<img width="975" height="425" alt="image" src="https://github.com/user-attachments/assets/1be50a35-cc5b-44ac-80ad-34599ba36e4b" />


## Advanced dbt Features Implemented

### 1️⃣ Model Contracts
- Enforced column types  
- Prevent schema drift  
- Ensures downstream model stability  

### 2️⃣ Unit Testing
- Custom unit tests validating transformation logic  
- Deterministic testing using controlled seed inputs  

### 3️⃣ External Expectations Package
- Integrated `dbt-expectations`  
- Statistical and rule-based validation  
- Advanced data quality assertions beyond built-in tests  

### 4️⃣ Hooks
- `on-run-start` for permission management  
- Audit logging table creation  
- Model-level hooks for metadata tracking  

### 5️⃣ Automated Documentation
- `dbt docs generate`  
- `dbt docs serve`  
- DAG visualization  
- Exposure & lineage tracking  
<img width="975" height="618" alt="image" src="https://github.com/user-attachments/assets/10a98143-193f-45c1-bea3-781cd914489d" />

## Key Improvements vs Previous Airbnb Project
<img width="700" height="280" alt="image" src="https://github.com/user-attachments/assets/3334e6e4-aedb-40b3-bfb0-9e6f95cdb555" />


