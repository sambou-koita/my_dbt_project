select 
  category_id,
  category_name
from {{ source('localbike_production_database', 'categories') }}