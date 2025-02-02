with order_items as (
  select 
    order_id,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_products,
    sum(total_order_item_amount) as total_order_amount
  from {{ ref('int_localbike__order_items') }}
  )

select
  ord.order_id,
  ord.customer_id,
  ord.order_status,
  ord.order_date,
  ord.required_date,
  ord.shipped_date,
  ord.store_id,
  ord.staff_id,
  oi.total_items,
  oi.total_distinct_products,
  oi.totalorder_amount
from {{ ref('stg_localbike_sales_database__orders') }} as ord
  left join order_items as oi on ord.order_id = oi.order_id