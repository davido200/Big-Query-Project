-- QUERY 1.1

SELECT products.ProductID
      ,products.Name,products.ProductNumber
      ,products.Size,products.Color
      ,sub_category.ProductSubcategoryID
      ,sub_category.Name As SubCategory
FROM `tc-da-1.adwentureworks_db.product` AS products
JOIN `tc-da-1.adwentureworks_db.productsubcategory` AS sub_category 
ON products.ProductSubcategoryID = sub_category.ProductSubcategoryID
ORDER BY sub_category.Name

-- QUERY 1.2

SELECT products.ProductID
      ,products.Name
      ,products.ProductNumber
      ,products.Size,products.Color
      ,sub_category.ProductSubcategoryID
      ,sub_category.Name As SubCategory
      ,productCategory.Name As productCategory
FROM `tc-da-1.adwentureworks_db.product` AS products
JOIN `tc-da-1.adwentureworks_db.productsubcategory` AS sub_category 
ON products.ProductSubcategoryID = sub_category.ProductSubcategoryID
JOIN `tc-da-1.adwentureworks_db.productcategory` productCategory
ON sub_category.ProductCategoryID = productCategory.ProductCategoryID
ORDER BY productCategory

-- QUERY 1.3

SELECT products.ProductID
    ,products.Name,products.ProductNumber
    ,products.Size,products.Color
    ,sub_category.ProductSubcategoryID
    ,sub_category.Name As SubCategory
    ,productCategory.Name As productCategory
    ,products.ListPrice,products.SellEndDate
FROM `tc-da-1.adwentureworks_db.product` AS products
JOIN `tc-da-1.adwentureworks_db.productsubcategory` AS sub_category 
ON products.ProductSubcategoryID = sub_category.ProductSubcategoryID
JOIN `tc-da-1.adwentureworks_db.productcategory` AS productCategory
ON sub_category.ProductCategoryID = productCategory.ProductCategoryID
WHERE products.SellEndDate IS NULL AND productCategory.Name = 'Bikes' AND products.ListPrice > 2000 
ORDER BY products.ListPrice DESC

-- QUERY 2.1

SELECT workorderrouting.LocationID
      ,COUNT(DISTINCT workorder.WorkOrderID) AS no_work_oders
      ,COUNT(DISTINCT workorder.ProductID) AS no_unique_product
      ,SUM(workorderrouting.ActualCost) AS ActualCost
FROM `tc-da-1.adwentureworks_db.workorder` AS workorder 
JOIN `tc-da-1.adwentureworks_db.workorderrouting` AS workorderrouting 
ON workorder.WorkOrderID = workorderrouting.WorkOrderID
WHERE ActualStartDate >= '2004-01-01' AND ActualStartDate < '2004-02-01'
GROUP BY workorderrouting.LocationID
ORDER BY ActualCost DESC

-- QUERY 2.2

SELECT workorderrouting.LocationID
      ,location.Name AS Location
      ,COUNT(DISTINCT workorder.WorkOrderID) AS no_work_oders
      ,COUNT(DISTINCT workorder.ProductID) AS no_unique_product
      ,SUM(workorderrouting.ActualCost) AS ActualCost
      ,ROUND(AVG(TIMESTAMP_DIFF(workorderrouting.ActualEndDate, workorderrouting.ActualStartDate, DAY)),2) AS AverageDays
FROM `tc-da-1.adwentureworks_db.workorder` AS workorder 
JOIN `tc-da-1.adwentureworks_db.workorderrouting` AS workorderrouting 
ON workorder.WorkOrderID = workorderrouting.WorkOrderID
JOIN `tc-da-1.adwentureworks_db.location` AS location 
ON workorderrouting.LocationID = location.LocationID
WHERE ActualStartDate >= '2004-01-01' AND ActualStartDate < '2004-02-01'
GROUP BY workorderrouting.LocationID,location
ORDER BY ActualCost DESC

-- QUERY 2.3

SELECT workorder.WorkOrderID
      ,SUM(workorderrouting.ActualCost) As ActualCost
FROM `tc-da-1.adwentureworks_db.workorder` AS workorder 
JOIN `tc-da-1.adwentureworks_db.workorderrouting` AS workorderrouting 
ON workorder.WorkOrderID = workorderrouting.WorkOrderID
WHERE ActualStartDate >= '2004-01-01' AND ActualStartDate < '2004-02-01' 
GROUP BY workorder.WorkOrderID
HAVING ActualCost > 300


-- QUERY 3.1

SELECT DISTINCT sales_detail.SalesOrderId
      ,sales_detail.OrderQty
      ,sales_detail.UnitPrice
      ,sales_detail.LineTotal
      ,sales_detail.ProductId
      ,sales_detail.SpecialOfferID
      ,spec_offer.Category
      ,spec_offer.Description

FROM `tc-da-1.adwentureworks_db.salesorderdetail`  as sales_detail
left join `tc-da-1.adwentureworks_db.specialofferproduct` as spec_offer_product
on sales_detail.productId = spec_offer_product.ProductID
left join `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
on sales_detail.SpecialOfferID = spec_offer.SpecialOfferID
order by LineTotal desc
Limit 1000

-- QUERY 3.2

/* In the initial query results, there were duplicate entries 
for order products due to variations in the spec_offer_product.
ModifiedDate column. This column records different modification 
dates for each product, resulting in multiple entries for the 
same order, which appeared as duplicates. To address this issue, 
I excluded the spec_offer_product.ModifiedDate column from the 
selected columns and applied the DISTINCT keyword to ensure each 
order product is unique.
*/

SELECT vendor.VendorId as Vendor_Id
      ,vendor_contact.ContactId
      ,vendor_contact.ContactTypeId
      ,vendor.Name
      ,vendor.CreditRating
      ,vendor.ActiveFlag
      ,vendor_address.AddressId
      ,address.City
FROM `tc-da-1.adwentureworks_db.vendor` as vendor    
LEFT JOIN `tc-da-1.adwentureworks_db.vendorcontact` as vendor_contact 
ON vendor.VendorID = vendor_contact.VendorID
LEFT JOIN `tc-da-1.adwentureworks_db.vendoraddress` as vendor_address
ON vendor.VendorID = vendor_address.VendorID
LEFT JOIN `tc-da-1.adwentureworks_db.address` as address
ON vendor_address.AddressID = address.AddressID

