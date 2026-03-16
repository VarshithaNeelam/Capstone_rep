{{ config(materialized='view') }}
 
SELECT
 
c.campaignname,
 
SUM(f.total_sales_influenced) AS total_sales_generated
 
FROM {{ ref('fact_marketing_perf') }} f
 
JOIN {{ ref('dim_marketing_campaign') }} c
ON f.campaignkey = c.campaignkey
 
GROUP BY c.campaignname
 
ORDER BY total_sales_generated