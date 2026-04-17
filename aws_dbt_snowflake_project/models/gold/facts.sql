{% set congigs= [
    {
        "table_name": "airbnb.gold.gold_obt",
        "columns": "gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.accommodates, gold_obt.bedrooms, gold_obt.bathrooms, gold_obt.price_per_night, gold_obt.total_booking_amount, gold_obt.service_fee, gold_obt.cleaning_fee",
        "alias": "gold_obt"
    },
    {
        "table_name": "airbnb.gold.dim_listings",
        "columns": "",
        "alias": "dim_listings",
        "join_condition": "gold_obt.listing_id = dim_listings.listing_id"
    },
    {
        "table_name": "airbnb.gold.dim_hosts",
        "columns": "",
        "alias": "dim_hosts",
        "join_condition": "gold_obt.host_id = dim_hosts.host_id"
    }
] %}

select 
    
        {{ congigs[0]['columns'] }}
    
from 
{% for config in congigs %}
    {% if loop.first %}
      {{ config['table_name'] }} as {{ config['alias'] }}
    {% else %}
      left join {{ config['table_name'] }} as {{ config['alias'] }} 
      on {{ config['join_condition'] }}
    {% endif %}
{% endfor %}