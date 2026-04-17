{% set congigs= [
    {
        "table_name": "airbnb.silver.silver_bookings",
        "columns": "silver_bookings.*",
        "alias": "silver_bookings"
    },
    {
        "table_name": "airbnb.silver.silver_listings",
        "columns": "silver_listings.host_id, silver_listings.property_type, silver_listings.room_type, silver_listings.CITY, silver_listings.accommodates, silver_listings.bedrooms, silver_listings.bathrooms, silver_listings.price_per_night, silver_listings.price_category, silver_listings.created_at as listing_created_at",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.listing_id = silver_listings.listing_id"
    },
    {
        "table_name": "airbnb.silver.silver_hosts",
        "columns": "silver_hosts.host_name, silver_hosts.host_since, silver_hosts.is_superhost, silver_hosts.host_response_category, silver_hosts.created_at as host_created_at",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.host_id = silver_hosts.host_id"
    }
] %}

select 
    {% for config in congigs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
from 
{% for config in congigs %}
    {% if loop.first %}
      {{ config['table_name'] }} as {{ config['alias'] }}
    {% else %}
      left join {{ config['table_name'] }} as {{ config['alias'] }} 
      on {{ config['join_condition'] }}
    {% endif %}
{% endfor %}