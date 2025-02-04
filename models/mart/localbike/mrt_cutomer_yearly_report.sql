 with customer_orders as (
  select 
   customer_id,
   extract(year from order_date) as order_year,
   sum(total_order_amount) as year_order_amount
  from {{ ref('int_localbike__orders') }}
  group by 
    customer_id,
     extract(year from order_date)
)
select 
  cust.customer_id,
  cust.city,
  cust.state,
  cust.zip_code,
  cust_ord.order_year,
  cust_ord.year_order_amount,
  extract(year from cust.dt_first_order) as first_order_year,
  cust.total_amount_spent as total_amount_spent_alltime,
  cust.total_orders as total_orders_alltime
from {{ ref('int_localbike__customers') }} as cust
left join  customer_orders as cust_ord
  on cust_ord.customer_id = cust.customer_id