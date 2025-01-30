select 
  store_id,
  store_name,
  phone,
  email,
  street,
  city,
  state,
  cast(zip_code as string) as zip_code
from {{ source('localbike_sales_database', 'stores') }}