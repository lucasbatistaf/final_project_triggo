{{
    config(
        tags=['staging', 'nordeste', 'estados']
    )
}}


with source as (
    select
        dtobito as data_obito,
        dtnasc::integer as data_nascimento,
        causabas as causa_obito,
        sexo,
        coalesce(racacor, 0)::integer as raca,
        coalesce(esc, 0)::integer as escolaridade,
        codmunres as id_mun_residencia,
        codmunocor as id_mun_ocorrencia
    from {{ source('NORDESTE', 'AL') }}
)

select *
from source