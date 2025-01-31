select 
  concatenate(order_id, item_id) as order_item_id,
  order_id,
  item_id,
  product_id,
  quantity,
  list_price,
  discount,
  (list_price * quantity * discount) as total_order_item_amount
from {{ source('localbike_sales_database', 'order_items') }}