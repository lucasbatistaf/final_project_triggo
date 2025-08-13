{{
    config(
        tags=['staging', 'utilities']
    )
}}


with source as (
    select
        subcategoria as id_subcategoria,        
        replace(descricao, '"', '') as desc_subcategoria,
    from {{ source('UTILITIES', 'CID_10_SUBCATEGORIAS') }}
)

select *
from source