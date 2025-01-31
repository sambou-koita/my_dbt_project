select
    order_item_id,
    discount
from {{ ref('stg_sales_database__order_item') }}
where discount < 0