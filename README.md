# Projeto Final do Bootcamp da Triggo.ai

### Objetivo

###


---

### Dados utilizados, Extração e Limpeza dos Dados

Os dados utilizados neste projeto foram retirados da base do DataSUS, mais em específico do SIM - Sistema de Informação de Mortalidade, e se referem à Mortalidade no Brasil nos períodos de 2013 até 2023 e abragem todos os estados brasileiros.

A extração foi feita de maneira manual através do site do [DataSUS - Transferência de arquivos](https://datasus.saude.gov.br/transferencia-de-arquivos/), resultado em diversos arquivos no formato .dbc, separados por ano e estado.

Para abrir o formato .dbc é necessário utilizar um programa específico ou a outra solução que encontrei, converter estes arquivos para o formato csv utilizando o projeto [dbc2csv](https://github.com/greatjapa/dbc2csv), que tornou possivel este projeto.

Após a conversão destes arquivos, eles foram movidos para pastas específicas de cada estado e através do uso de Python no script data_loading.py, as tabelas tiveram uma filtragem básica de colunas que seriam utilizadas no projeto e sofreram um UNION ALL, tendo como separação o estado onde foram registrados os óbitos. E então foram enviados para o Snowflake utilizando o conector disponibilizado em Python.
