select 
  brand_id,
  brand_name
from {{ source('localbike_production_database', 'brands') }}