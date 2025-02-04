 with store_sales as (
  select 
   store_id,
   extract(year from order_date) as sales_year,
   sum(total_order_amount) as year_sales_amount
  from {{ ref('int_localbike__orders') }}
  group by 
    store,
     extract(year from order_date)
)
select 
  stores.store_id,
  stores.store_name,
  stores.city,
  stores.state,
  stores.zip_code,
  store_sales.sales_year,
  store_sales.year_sales_amount

from {{ ref('stg_localbike_sales_database__stores') }} as stores
left join store_sales as store_sales
  on stores.store_id = store_sales.store_id