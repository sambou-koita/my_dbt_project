select
    order_item_id,
    discount
from {{ ref('stg_localbike_sales_database__order_items') }}
where discount < 0