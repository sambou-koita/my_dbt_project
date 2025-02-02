with  orders as (
	select  
      customer_id, 
      min(order_date) dt_first_order,
      max(order_date) dt_last_order,
      date_diff(current_date(), min(order_date), month ) as longevity,
      sum(total_order_amount) as total_amount_spent,
 	  sum(total_items) as total_items,
 	  count(distinct order_id) as total_orders
    from {{ ref('int_localbike__orders') }}
    group by customer_id )

select 
  customer_id,
  first_name,
  last_name,
  phone,
  email,
  street,
  city,
  state,
  zip_code,

  ord.dt_first_order,
  ord.dt_last_order,
  ord.longevity,
  ord.total_amount_spent + 0 as total_amount_spent,
  ord.total_orders + 0 as total_amount_spent
from 
  {{ ref('localbike_sales_database__customers') }} as cust
  left join orders as ord on cust.customer_id = ord.customer_id




