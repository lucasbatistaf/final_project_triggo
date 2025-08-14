{{
    config(
        tags=['marts', 'dim']
    )
}}


with source as (
    select
        id_municipio,
        nome_municipio,
        uf,
        nome_uf,
        nome_regiao
    from {{ ref('stg_utilities__cidades_info') }}
)

select *
from source