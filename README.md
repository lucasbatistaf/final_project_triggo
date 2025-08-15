# Projeto Final do Bootcamp da Triggo.ai

### Objetivo

Este projeto tem como objetivo a extração, ingestão, limpeza e transformação de dados do DataSUS além da criação de um dashboard contendo a analise final dos dados.

Vídeo de apresentação do projeto está disponibilizado neste [link](https://youtu.be/Sh6PbnDsKN8)

(Sou pessímo narrador de vídeo)

---


### Dados utilizados e Extração

Os dados utilizados neste projeto foram retirados da base do DataSUS, mais em específico do SIM - Sistema de Informação de Mortalidade, e se referem à Mortalidade no Brasil nos períodos de 2013 até 2023 e abragem todos os estados brasileiros.

A extração foi feita de maneira manual através do site do [DataSUS - Transferência de arquivos](https://datasus.saude.gov.br/transferencia-de-arquivos/), resultado em diversos arquivos no formato .dbc, separados por ano e estado.

Para abrir o formato .dbc é necessário utilizar um programa específico ou a outra solução que encontrei, converter estes arquivos para o formato csv utilizando o projeto [dbc2csv](https://github.com/greatjapa/dbc2csv), que tornou possivel este projeto.


---  


### Seleção de Colunas e Ingestão dos Dados no Snowflake

Após a conversão destes arquivos, eles foram movidos para pastas específicas de cada estado e através do uso de Python no script data_loading.py, as tabelas tiveram uma filtragem básica de colunas que seriam utilizadas no projeto e foram concatenadas, tendo como separação o estado onde foram registrados os óbitos.
Os arquivos foram enviados para o Snowflake utilizando o conector disponibilizado em Python.


---  


### Conversão dos dados do DataSUS

Os dados vindos do DataSUS, baixados através do site [DataSUS/Transferencia de Arquivo](https://datasus.saude.gov.br/transferencia-de-arquivos/) são disponibilizados no formato .dbc, que por sua vez só pode ser aberto por um programa disponibilizado pelo próprio site ou pode ser convertido em .csv através de diversas técnicas. Utilizei para conversão em .csv este [projeto](https://github.com/greatjapa/dbc2csv), o qual tornou possivel o uso desses dados no meu projeto.

---


### Modelagem dos Dados

Utilizando a conexão com o Snowflake, fiz a criação das staging dentro do dbt para consolidação desses dados para dentro do projeto, no ratio de 1:1 stagings e bases de dados de dados cada estado.
Após a criação das stagings de cada estado, criei tabelas Intermediates de cada região do Brasil, após isso uma única tabela foi gerada, chamada INT_REGIOES.
Duas novas tabelas foram adicionadas ao projeto a primeira contendo informações sobre municipios, estados e regiões do Brasil e a segunda contendo a informações sobre os nomes e siglas de cada óbito.

A partir deste ponto, a modelagem chega ao estágio de Fatos e Dimensões e a modelagem resultante foi:
- fct_obitos: a tabela fato com os mais diversos valores e ligando toda as tabelas utilizadas
- dim_causa_obito: tabela com o ID de cada tipo de óbito assim como a descrição de cada óbito
- dim_datas: tabela com as mais diversas informações sobre datas
- dim_localidades: tabela com os nomes de municípios, estados e regiões e respectivos ID's
- mart_geral: contendo informações gerais sobre os óbitos
- mart_tendencias: contendo a informação a principal causa de morte de um grupo de pessoas e sua evolução ao longo do tempo


![fact and dim tables](https://github.com/lucasbatistaf/final_project_triggo/blob/main/fact%20and%20dim.png)
