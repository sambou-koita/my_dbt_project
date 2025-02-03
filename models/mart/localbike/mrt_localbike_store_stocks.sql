with stores_product_total_sale_4w as (
  select 
    ord.store_id,
    oi.product_id,
    oi.product_name,
    sum(oi.quantity) as total_4w_sales
  FROM {{ ref('int_localbike__orders') }} as ord
    inner join {{ ref('int_localbike__order_items') }} as oi
      on ord.order_id = oi.order_id
  where ord.order_date <= parse_date('%Y-%m-%d',  '2018-04-30') -- condition a supprimer en production
    and date_diff(parse_date('%Y-%m-%d',  '2018-04-30'), ord.order_date, week) <= 4 -- 2018-04-30 a remplacer par la date du jour
  group by 
    ord.store_id,
    oi.product_id,
    oi.product_name
)
select 
  st.store_id,
  st.store_name,
  prd_sales.product_id,
  prd_sales.product_name,
  prd_sales.total_4w_sales,
  stk.quantity as stock_quantity,
  case when stk.quantity = 0 then  ( (prd_sales.total_4w_sales + 1) * 100)
    else (100 * prd_sales.total_4w_sales / stk.quantity) end as indc_stock
  from 
    {{ ref('stg_localbike_sales_database__stores') }} as st
  left join stores_product_total_sale_4w as prd_sales on prd_sales.store_id = st.store_id
  left join {{ ref('stg_localbike_production_database__stocks') }} as stk 
    on prd_sales.product_id = stk.product_id and prd_sales.store_id = stk.store_id 

