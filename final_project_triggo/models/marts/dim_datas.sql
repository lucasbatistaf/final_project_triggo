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
    replace(data_obito, '-', '')::integer as id_data_obito,
    data_obito,
    date_part(day, data_obito) as dia_obito,
    date_part(month, data_obito) as mes_obito,
    date_part(year, data_obito) as ano_obito,
    date_part(quarter, data_obito) as trimestre_obito    
from regioes
where rn = 1