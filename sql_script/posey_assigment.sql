-- Question 1
SELECT id FROM orders WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Question 2
SELECT * FROM orders WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Question 3
SELECT name as company_name  
FROM accounts 
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
AND (primary_poc NOT LIKE '%eana%');


-- Question 4
SELECT region.name AS region, sales_reps.name AS sales_rep, 
		accounts.name AS account_name 
FROM region 
JOIN sales_reps ON region.id = sales_reps.region_id 
JOIN accounts ON sales_reps.id = accounts.sales_rep_id 
ORDER BY accounts.name;
