{{
  config(materialized = 'incremental',
  unique_key = 'booking_id')
}}

select 
    booking_id,
    listing_id,
    booking_date,
    {{ multiply('nights_booked', 'booking_amount', 2) }} as total_booking_amount,
    service_fee,
    cleaning_fee,
    booking_status,
    created_at
from {{ ref('bronze_bookings') }}