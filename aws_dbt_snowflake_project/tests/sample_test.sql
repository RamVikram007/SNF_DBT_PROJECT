/*{{
  config(
    severity='warn'
    )
}}

--if I remove config block, the test will throw error.

select 1 from {{ source('staging', 'bookings') }}
where booking_amount < 100 */