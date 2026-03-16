SELECT
 
/* Surrogate Key */
{{ dbt_utils.generate_surrogate_key(['campaign_id']) }} AS campaignkey,
 
/* Business Key */
campaign_id AS campaignid,
campaign_name AS campaignname,
campaign_type AS campaigntype,

/* Dimension Attributes */
audience_segment AS target_audience_segment,
 
budget,
 
campaign_duration_days AS duration,
 
expected_roi AS roi,
 
start_date,
 
end_date
 
FROM {{ ref('silver_campaign') }}