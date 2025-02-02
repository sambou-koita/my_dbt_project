with order_items as (
  select 
    oi.order_id,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_products,
    sum(oi.total_order_item_amount) as total_order_amount
  from {{ ref('int_localbike__order_items') }}
  )

select
  order.order_id,
  order.customer_id,
  order.order_status,
  order.order_date,
  order.required_date,
  order.shipped_date,
  order.store_id,
  order.staff_id,
  oi.total_items,
  oi.total_distinct_products,
  oi.totalorder_amount
from {{ ref('stg_localbike_sales_database__orders') }} as order
  left join order_items as oi on order.order_id = oi.order_id