{{
  config(
    materialized = 'ephemeral'
    )
}}

with hosts as (
    select
        host_id,
        host_name,
        host_since,
        is_superhost,
        host_response_category,
        host_created_at
    from {{ ref('gold_obt') }}
)

select * from hosts