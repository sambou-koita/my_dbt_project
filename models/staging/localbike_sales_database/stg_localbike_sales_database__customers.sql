select 
  customer_id,
  first_name,
  last_name,
  case when phone = 'NULL' then null else phone end as phone,
  email,
  street,
  city,
  state,
  cast(zip_code as string) as zip_code
from {{ source('localbike_sales_database', 'customers') }}