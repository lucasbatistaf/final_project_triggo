{{
    config(
        tags=['marts', 'fact'],
        materialized='table'
    )
}}


-- select
--     id_data_obito,
--     id_causa_obito,
--     id_mun_residencia,
--     id_uf_residencia,
--     id_regiao_residencia,
--     id_mun_ocorrencia,
--     id_uf_ocorrencia,
--     id_regiao_ocorrencia,
--     sexo,
--     raca,
--     escolaridade,
--     idade
-- from regioes