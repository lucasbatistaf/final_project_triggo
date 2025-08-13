{{
    config(
        tags=['intermediate', 'centrooeste', 'regioes'],
        materialized="table"
    )
}}

with union_estados as (
    select
        'DF' as sig_estado,
        *
    from {{ ref('stg_centrooeste__df') }}

    UNION ALL

    select
        'GO' as sig_estado,
        *
    from {{ ref('stg_centrooeste__go') }}

    UNION ALL

    select
        'MS' as sig_estado,
        *
    from {{ ref('stg_centrooeste__ms') }}

    UNION ALL

    select
        'MT' as sig_estado,
        *
    from {{ ref('stg_centrooeste__mt') }}
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
    sig_estado
from union_estados