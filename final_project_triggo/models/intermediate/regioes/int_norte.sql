{{
    config(
        tags=['intermediate', 'norte', 'regioes'],
        materialized='table'
    )
}}

with union_estados as (
    select
        'AC' as uf,
        *
    from {{ ref('stg_norte__ac') }}

    UNION ALL

    select
        'AM' as uf,
        *
    from {{ ref('stg_norte__am') }}

    UNION ALL

    select
        'AP' as uf,
        *
    from {{ ref('stg_norte__ap') }}

    UNION ALL

    select
        'PA' as uf,
        *
    from {{ ref('stg_norte__pa') }}

    UNION ALL

    select
        'RO' as uf,
        *
    from {{ ref('stg_norte__ro') }}

    UNION ALL

    select
        'RR' as uf,
        *
    from {{ ref('stg_norte__rr') }}

    UNION ALL

    select
        'TO' as uf,
        *
    from {{ ref('stg_norte__to') }}
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
    uf
from union_estados