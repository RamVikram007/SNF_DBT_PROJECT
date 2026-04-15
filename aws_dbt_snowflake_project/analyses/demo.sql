{% set listing_id = 111 %}

select * from {{ ref('bronze_bookings') }}
where listing_id > {{ listing_id }}