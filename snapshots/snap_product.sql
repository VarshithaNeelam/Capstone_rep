{% snapshot snap_product %}
 
{{
config(
target_database='CAPSTONE_DB',
target_schema='BRONZE',
unique_key='product_id',
strategy='timestamp',
updated_at='last_modified_date'
)
}}
 
SELECT *
FROM {{ ref('bronze_product') }}
 
QUALIFY ROW_NUMBER() OVER(
PARTITION BY product_id
ORDER BY last_modified_date DESC
)=1
 
{% endsnapshot %}