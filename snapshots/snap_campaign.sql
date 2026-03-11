{% snapshot snap_campaign %}
 
{{
config(
target_database='CAPSTONE_DB',
target_schema='BRONZE',
unique_key='campaign_id',
strategy='timestamp',
updated_at='last_modified_date'
)
}}
 
SELECT *
FROM {{ ref('bronze_campaign') }}
 
QUALIFY ROW_NUMBER() OVER(
PARTITION BY campaign_id
ORDER BY last_modified_date DESC
)=1
 
{% endsnapshot %}