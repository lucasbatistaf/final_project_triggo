{{
    config(
        tags=['intermediate', 'norte', 'regioes'],
        materialized="table"
    )
}}

with union_estados as (
    select
        'AC' as sig_estado,
        *
    from {{ ref('stg_norte__ac') }}

    UNION ALL

    select
        'AM' as sig_estado,
        *
    from {{ ref('stg_norte__am') }}

    UNION ALL

    select
        'AP' as sig_estado,
        *
    from {{ ref('stg_norte__ap') }}

    UNION ALL

    select
        'PA' as sig_estado,
        *
    from {{ ref('stg_norte__pa') }}

    UNION ALL

    select
        'RO' as sig_estado,
        *
    from {{ ref('stg_norte__ro') }}

    UNION ALL

    select
        'RR' as sig_estado,
        *
    from {{ ref('stg_norte__rr') }}

    UNION ALL

    select
        'TO' as sig_estado,
        *
    from {{ ref('stg_norte__to') }}
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