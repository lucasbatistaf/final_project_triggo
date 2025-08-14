{{
    config(
        tags=['intermediate', 'nordeste', 'regioes'],
        materialized='table'
    )
}}

with union_estados as (
    select
        'AL' as uf,
        *
    from {{ ref('stg_nordeste__al') }}

    UNION ALL

    select
        'BA' as uf,
        *
    from {{ ref('stg_nordeste__ba') }}

    UNION ALL

    select
        'CE' as uf,
        *
    from {{ ref('stg_nordeste__ce') }}

    UNION ALL

    select
        'MA' as uf,
        *
    from {{ ref('stg_nordeste__ma') }}

    UNION ALL

    select
        'PB' as uf,
        *
    from {{ ref('stg_nordeste__pb') }}

    UNION ALL

    select
        'PE' as uf,
        *
    from {{ ref('stg_nordeste__pe') }}

    UNION ALL

    select
        'PI' as uf,
        *
    from {{ ref('stg_nordeste__pi') }}

    UNION ALL

    select
        'RN' as uf,
        *
    from {{ ref('stg_nordeste__rn') }}

    UNION ALL

    select
        'SE' as uf,
        *
    from {{ ref('stg_nordeste__se') }}
)

select
    {{ date_fixing('data_obito') }} as data_obito,
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