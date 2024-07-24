# Big Query Project

This project involves executing and optimizing various SQL queries on an AdventureWorks database to extract meaningful insights and validate existing queries. The tasks are divided into three main sections: product extraction, work order review, and query validation.

## Table of Contents
- [Tasks](#tasks)
  - [Task 1: Extracting Product Data](#task-1-extracting-product-data)
  - [Task 2: Reviewing Work Orders](#task-2-reviewing-work-orders)
  - [Task 3: Query Validation](#task-3-query-validation)
- [Results](#Results)


## Tasks

### Task 1: Extracting Product Data

#### 1.1 Extract Product Data with Subcategory
**Objective:** Extract the data on products from the Product table where there exists a product subcategory, and include the name of the ProductSubcategory.

**Columns Needed:** 
- ProductId
- Name
- ProductNumber
- Size
- Color
- ProductSubcategoryId
- Subcategory Name

**Order By:** Subcategory Name

#### 1.2 Include Product Category Name
**Objective:** Extend the query from Task 1.1 to include the product category name and order the results by Category Name.

**Order By:** Category Name

#### 1.3 Most Expensive Bikes
**Objective:** Use the established query to select the most expensive (price listed over 2000) bikes that are still actively sold (do not have a sales end date).

**Order By:** Most to Least Expensive Bike

### Task 2: Reviewing Work Orders

#### 2.1 Aggregated Work Orders
**Objective:** Create an aggregated query to select:
- Number of unique work orders
- Number of unique products
- Total actual cost
- For each location Id from the 'workoderrouting' table for orders in January 2004.

#### 2.2 Add Location Name and Average Days
**Objective:** Update the query from Task 2.1 by adding the name of the location and also the average days between actual start date and actual end date per each location.

#### 2.3 Expensive Work Orders
**Objective:** Select all the expensive work orders (above 300 actual cost) that happened throughout January 2004.

### Task 3: Query Validation

#### 3.1 Special Offers Query
**Objective:** Investigate the query written by a colleague to find the list of orders connected to special offers and identify where the potential issue lies.

### 3.2 Query debugging
**Objective:** Your colleague has written this query to collect basic Vendor information. The query does not work, look into the query and find ways to fix it. Can you provide any feedback on how to make this query be easier to debug/read?

# Results

The detailed data query and results sheets can be found in the following Google Sheet: [Results](https://docs.google.com/spreadsheets/d/1MuWSc4M7keJRT4ZHwW_0n_hHk6Xh8dfS/edit?usp=sharing&ouid=105081269935229896105&rtpof=true&sd=true)
