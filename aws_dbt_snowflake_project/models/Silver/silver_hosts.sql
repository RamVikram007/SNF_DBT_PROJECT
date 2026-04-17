{{
  config(
    materialized = 'incremental', unique_key = 'host_id'
    )
}}

select 
    host_id,
    replace(host_name, ' ', '_') as host_name,
    host_since,
    is_superhost,
    {{ response_rate('response_rate') }} as host_response_category,
    created_at
from {{ ref('bronze_hosts') }}