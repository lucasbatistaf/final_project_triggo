{{
    config(
        tags=['intermediate', 'nordeste', 'regioes'],
        materialized="table"
    )
}}

with union_estados as (
    select
        'AL' as sig_estado,
        *
    from {{ ref('stg_nordeste__al') }}

    UNION ALL

    select
        'BA' as sig_estado,
        *
    from {{ ref('stg_nordeste__ba') }}

    UNION ALL

    select
        'CE' as sig_estado,
        *
    from {{ ref('stg_nordeste__ce') }}

    UNION ALL

    select
        'MA' as sig_estado,
        *
    from {{ ref('stg_nordeste__ma') }}

    UNION ALL

    select
        'PB' as sig_estado,
        *
    from {{ ref('stg_nordeste__pb') }}

    UNION ALL

    select
        'PE' as sig_estado,
        *
    from {{ ref('stg_nordeste__pe') }}

    UNION ALL

    select
        'PI' as sig_estado,
        *
    from {{ ref('stg_nordeste__pi') }}

    UNION ALL

    select
        'RN' as sig_estado,
        *
    from {{ ref('stg_nordeste__rn') }}

    UNION ALL

    select
        'SE' as sig_estado,
        *
    from {{ ref('stg_nordeste__se') }}
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