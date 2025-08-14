{{
    config(
        tags=['marts', 'dim'],
        materialized='table'
    )
}}


with source as (
    select
        id_uf,
        uf,
        nome_uf
    from {{ ref('stg_utilities__cidades_info') }}
)

select *
from source