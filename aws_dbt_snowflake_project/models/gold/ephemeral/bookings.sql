{{
  config(
    materialized = 'ephemeral'
    )
}}

with bookings as (
    select 
        booking_id,
        booking_date,
        booking_status,
        created_at
    from {{ ref('gold_obt') }}
)

select * from bookings