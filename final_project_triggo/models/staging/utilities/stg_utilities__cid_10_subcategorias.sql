{{
    config(
        tags=['staging', 'utilities']
    )
}}


with source as (
    select
        *
    from {{ source('UTILITIES', 'CID_10_SUBCATEGORIAS') }}
)

select *
from source