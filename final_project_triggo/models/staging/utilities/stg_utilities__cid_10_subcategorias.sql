{{
    config(
        tags=['staging', 'utilities']
    )
}}


with source as (
    select
        subcategoria as id_causa_obito,        
        replace(descricao, '"', '') as desc_causa_obito,
    from {{ source('UTILITIES', 'CID_10_SUBCATEGORIAS') }}
)

select *
from source