{{ config(materialized='view') }}
 
SELECT
 
c.campaigntype,
 
AVG(f.roi_percentage) AS avg_roi_percentage
 
FROM {{ ref('fact_marketing_perf') }} f
 
JOIN {{ ref('dim_marketing_campaign') }} c
ON f.campaignkey = c.campaignkey
 
GROUP BY c.campaigntype
 
ORDER BY avg_roi_percentage DESC