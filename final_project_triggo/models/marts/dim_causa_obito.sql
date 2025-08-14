{{
    config(
        tags=['marts', 'dim'],
        materialized='table'
    )
}}

with source as (
    select
        id_causa_obito,
        desc_causa_obito
    from {{ ref('stg_utilities__cid_10_subcategorias') }}
)

select *
from source