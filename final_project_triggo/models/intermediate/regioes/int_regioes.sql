{{
    config(
        tags=['intermediate', 'centrooeste', 'regioes'],
        materialized='table'
    )
}}

with union_regioes as (
    select
        data_obito,
        causa_obito as id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_centrooeste') }}

    UNION ALL

    select
        data_obito,
        causa_obito as id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_nordeste') }}

    UNION ALL

    select
        data_obito,
        causa_obito as id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_norte') }}

    UNION ALL

    select
        data_obito,
        causa_obito as id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_sudeste') }}

    UNION ALL

    select
        data_obito,
        causa_obito as id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_sul') }}
)

select
    *
from union_regioes