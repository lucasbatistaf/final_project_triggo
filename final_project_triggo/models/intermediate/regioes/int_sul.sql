{{
    config(
        tags=['intermediate', 'sul', 'regioes'],
        materialized="table"
    )
}}

with union_estados as (
    select
        'RS' as uf,
        *
    from {{ ref('stg_sul__rs') }}

    UNION ALL

    select
        'SC' as uf,
        *
    from {{ ref('stg_sul__sc') }}

    UNION ALL

    select
        'PR' as uf,
        *
    from {{ ref('stg_sul__pr') }}
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
    uf as uf_residencia
from union_estados