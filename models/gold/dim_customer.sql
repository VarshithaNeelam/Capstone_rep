SELECT
 
/* Surrogate Key */
ROW_NUMBER() OVER (ORDER BY customer_id, dbt_valid_from) AS customerkey,
 
/* Business Key */
customer_id,
 
/* Customer Info */
full_name,
 
/* Contact */
valid_email AS email,
valid_phone AS phone,
 
/* Address Details */
street,
city,
state,
zip_code,
country,
 
/* Demographic Information */
birth_date,
customer_age,
 
/* Segment */
customer_segment,
 
/* Registration Date */
registration_date,
 
/* Type 2 SCD Tracking */
dbt_valid_from AS start_date,
dbt_valid_to AS end_date,
 
CASE
    WHEN dbt_valid_to IS NULL THEN TRUE
    ELSE FALSE
END AS is_current
 
FROM {{ ref('silver_customer') }}