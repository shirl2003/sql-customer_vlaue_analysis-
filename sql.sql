SELECT * FROM customervalueanalysis.cutomer_aquition;

SELECT customer_id, SUM(revenue) AS TotalRevenue
FROM customervalueanalysis.cutomer_aquition
GROUP BY customer_id;

SELECT customer_id, COUNT(*) AS PurchaseFrequency
FROM customervalueanalysis.cutomer_aquition
GROUP BY customer_id;

SELECT customer_id, AVG(revenue) AS AvgPurchaseValue
FROM customervalueanalysis.cutomer_aquition
GROUP BY customer_id;

SELECT 
    customer_id,
    AVG(revenue) AS AvgPurchaseValue,
    COUNT(*) AS PurchaseFrequency,
    (AVG(revenue) * COUNT(*)) - MIN(cost) AS CLV
FROM customervalueanalysis.cutomer_aquition
    
GROUP BY 
    customer_id;

SELECT customer_id, CLV,
       CASE
           WHEN CLV >= 1000 THEN 'High Value'
           WHEN CLV BETWEEN 500 AND 999 THEN 'Medium Value'
           ELSE 'Low Value'
           END AS CLVSegment
FROM CLVTable;

