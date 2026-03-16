SELECT
 
{{ dbt_utils.generate_surrogate_key(['product_id']) }} AS productkey,
 
product_id,
 
product_name,
category,
subcategory,
brand,
reorder_level,

color,
size,
 
unit_price,
cost_price,
stock_quantity,
supplier_id
 
FROM {{ ref('silver_product') }}