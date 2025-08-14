{{
    config(
        tags=['marts', 'dim'],
        materialized='table'
    )
}}


with source as (
    select
        id_regiao,
        nome_regiao
    from {{ ref('stg_utilities__cidades_info') }}
)

select *
from source