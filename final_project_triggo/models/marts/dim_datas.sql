{{
    config(
        tags=['marts', 'dim'],
        materialized='table'
    )
}}

with regioes as (
    select
        data_obito,
        row_number() over (partition by data_obito order by data_obito) as rn 
    from {{ ref('int_regioes') }}
)

select
    replace(data_obito, '-', '')::integer as id_data,
    data_obito as datas,
    date_part(day, data_obito) as dia,
    date_part(month, data_obito) as mes,
    date_part(year, data_obito) as ano,
    date_part(quarter, data_obito) as trimestre   
from regioes
where rn = 1