{{
    config(
        tags=['intermediate', 'sudeste', 'regioes'],
        materialized="table"
    )
}}

with union_estados as (
    select
        'ES' as uf,
        *
    from {{ ref('stg_sudeste__es') }}

    UNION ALL

    select
        'MG' as uf,
        *
    from {{ ref('stg_sudeste__mg') }}

    UNION ALL

    select
        'RJ' as uf,
        *
    from {{ ref('stg_sudeste__rj') }}

    UNION ALL

    select
        'SP' as uf,
        *
    from {{ ref('stg_sudeste__sp') }}
)

select
    {{ date_fixing('data_obito') }} as data_obitos,
    causa_obito,
    sexo,
    raca,
    escolaridade,
    {{ date_fixing('data_nascimento') }} as data_nasc,
    datediff(year,{{ date_fixing('data_nascimento') }}, {{ date_fixing('data_obito') }} ) as idade,
    id_mun_residencia,
    id_mun_ocorrencia,
    uf
from union_estados