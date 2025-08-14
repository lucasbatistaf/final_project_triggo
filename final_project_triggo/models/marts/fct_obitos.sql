{{
    config(
        tags=['marts', 'fact'],
        materialized='table'
    )
}}

with causa_obito as (
    select 
        id_causa_obito
    from {{ ref('dim_causa_obito') }}
),

datas as (
    select
        id_data,
        datas
    from {{ ref('dim_datas') }}
),

localidades as (
    select 
        id_municipio
    from {{ ref('dim_localidades') }}
),

regioes as (
    select 
        data_obito,
        id_causa_obito,
        sexo,
        raca,
        escolaridade,
        idade,
        id_mun_residencia,
        id_mun_ocorrencia
    from {{ ref('int_regioes') }}
),

fact_table as (
    select
        da.id_data,
        co.id_causa_obito,
        lr.id_municipio as id_mun_residencia,
        lo.id_municipio as id_mun_ocorrencia,
        sexo,
        raca,
        escolaridade,
        idade
    from regioes as re
    left join causa_obito as co
        on re.id_causa_obito = co.id_causa_obito
    left join datas as da
        on re.data_obito = da.datas
    left join localidades as lr
        on re.id_mun_residencia = lr.id_municipio
    left join localidades as lo
        on re.id_mun_ocorrencia = lo.id_municipio
)

select *
from fact_table