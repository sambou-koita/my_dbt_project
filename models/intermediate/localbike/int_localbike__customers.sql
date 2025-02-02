with  orders as (
	select  
      customer_id, 
      min(order_date) dt_first_order,
      max(order_date) dt_last_order,
      date_diff(current_date(), min(order_date), month ) as longevity,


      sum(total_order_amount) AS total_amount_spent,
 	  SUM(total_items) as total_items,
 	  SUM(total_distinct_items) as total_distinct_items,
 	  COUNT(DISTINCT order_id) AS total_orders
    from {{ ref('stg_localbike_sales_database__orders') }}
    group by customer_id )

select 


