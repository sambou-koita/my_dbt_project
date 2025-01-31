select 
  staff_id,
  first_name,
  last_name,
  email,
  phone,
  active,
  store_id,
  cast( (case when manager_id =  'NULL' then null else manager_id end) as integer) as manager_id
from {{ source('localbike_sales_database', 'staffs') }}