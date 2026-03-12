{% snapshot snap_employee %}
 
{{
config(
target_database='CAPSTONE_DB',
target_schema='BRONZE', 
unique_key='employee_id',
strategy='timestamp',
updated_at='last_modified_date'
)
}}
 
SELECT *
FROM {{ ref('bronze_employee') }}
 
QUALIFY ROW_NUMBER() OVER(
PARTITION BY employee_id
ORDER BY last_modified_date DESC 
)=1
 
{% endsnapshot %}