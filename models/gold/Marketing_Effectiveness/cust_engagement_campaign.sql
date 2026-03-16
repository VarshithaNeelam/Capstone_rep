{{ config(materialized='view') }}
 
SELECT
 
c.campaignname,
 
SUM(f.new_customers_acquired) AS new_customers,
 
AVG(f.repeat_purchase_rate) AS avg_repeat_purchase_rate
 
FROM {{ ref('fact_marketing_perf') }} f
 
JOIN {{ ref('dim_marketing_campaign') }} c
ON f.campaignkey = c.campaignkey
 
GROUP BY c.campaignname
 
ORDER BY new_customers DESC