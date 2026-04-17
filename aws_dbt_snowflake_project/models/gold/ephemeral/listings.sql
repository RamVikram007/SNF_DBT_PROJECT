{{
  config(
    materialized = 'ephemeral'
    )
}}
with listings as(
    select
        listing_id,
        property_type,
        room_type,
        CITY,
        price_category,
        listing_created_at
    from {{ ref('gold_obt') }}
)
select * from listings