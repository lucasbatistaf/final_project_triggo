{{
    config(
        tags=['staging', 'utilities']
    )
}}


with source as (
    select
        id_municipio,
        replace(nome_municipio, '"', '') as nome_municipio,
        id_uf,
        uf,
        replace(nome_uf, '"', '') as nome_uf,
        id_regiao,
        nome_regiao
    from {{ source('UTILITIES', 'CIDADES_INFO') }}
)

select *
from source