select 
  oi.order_item_id,
  oi.order_id,
  oi.item_id,
  oi.product_id,
  oi.quantity,
  oi.list_price,
  oi.discount,
  oi.total_order_item_amount,
  prd.product_name,
  cat.category_name as product_category,
  brand.brand_name as product_brand_name

from
  {{ ref('stg_localbike_sales_database__order_items') }} as oi
  left join {{ ref('stg_localbike_production_database__products') }} prd 
    on oi.product_id = prd.product_id
  left join {{ ref('stg_localbike_production_database__categories') }} cat
    on prd.category_id = cat.category_id
  left join {{ ref('stg_localbike_production_database__brands') }} brand
    on prd.brand_id = brand.brand_id