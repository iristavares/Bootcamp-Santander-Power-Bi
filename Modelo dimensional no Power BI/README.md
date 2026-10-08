# Projeto de Modelagem de Dados com Power BI

**Sobre o projeto**

Este projeto foi desenvolvido como parte de um desafio de modelagem de dados utilizando o Power BI. O objetivo foi transformar a tabela única Financial Sample em um modelo dimensional baseado em Star Schema, estruturando os dados em tabelas de dimensão e fato para facilitar análises, consultas e a construção de indicadores.

A proposta do desafio consiste em utilizar a tabela original como fonte para criação das tabelas dimensionais e da tabela fato, selecionando e reorganizando os campos de acordo com suas respectivas finalidades. Também foram utilizadas transformações no Power Query e expressões DAX para complementar a estrutura do modelo.

**Objetivos**

- Transformar uma estrutura de dados originalmente centralizada em um modelo dimensional.
- Aplicar o conceito de Star Schema no Power BI.
- Separar informações descritivas e métricas em tabelas de dimensão e fato.
- Criar uma dimensão calendário utilizando DAX.
- Criar identificadores para relacionamento entre as tabelas.
- Organizar os dados para facilitar análises e futuras construções de dashboards.
- Aplicar transformações e recursos do Power Query e DAX.
- 
**Fonte de dados**

A fonte utilizada no projeto foi a tabela **Financial Sample**, disponibilizada como uma tabela única.

**Arquitetura do modelo**

O modelo foi estruturado seguindo o conceito de **Star Schema**, tendo a tabela `f_vendas` como tabela fato central e as demais tabelas como dimensões relacionadas.

**Tabela fato**

**f_vendas**

A tabela `f_vendas` concentra os principais registros relacionados às vendas e serve como tabela central do modelo.

Entre os campos presentes estão:

- Sales
- Country
- Date
- Discount Band
- id_produto
- Month Name
- entre outros campos relacionados ao processo de vendas

A tabela fato permite relacionar os registros de vendas às dimensões de produtos, descontos, calendário e detalhes.

**Tabelas dimensão**

**d_produtos**

A dimensão `d_produtos` concentra informações relacionadas aos produtos e indicadores derivados.

Entre os elementos presentes no modelo estão:

- Índice
- Média da manufatura
- Média do valor de venda

Essa dimensão permite analisar os dados de vendas sob a perspectiva dos produtos.

**d_produtos_detalhes**

A dimensão `d_produtos_detalhes` contém informações mais detalhadas sobre os produtos e seus valores comerciais.

Principais campos:

- id_produto
- Product
- Discount Band
- Manufacturing Price
- Sale Price
- Units Sold

Essa estrutura complementa a dimensão de produtos, fornecendo informações relacionadas aos preços, unidades vendidas e faixa de desconto.

**d_descontos**

A dimensão `d_descontos` foi criada para organizar as informações relacionadas aos descontos.

Principais campos:

- id_produto
- Discount
- Discount Band

Essa dimensão possibilita analisar o comportamento das vendas considerando as diferentes faixas e valores de desconto.

**d_detalhes**

A dimensão `d_detalhes` reúne informações adicionais sobre as vendas que não foram contempladas nas demais dimensões.

Entre os campos presentes estão:

- id_Detalhes
- Sales
- COGS
- Country
- Date
- Discount Band
- Discounts
- Gross Sales

A criação dessa tabela segue a orientação do desafio de identificar e organizar informações adicionais que fornecem maior detalhamento sobre as vendas. :contentReference[oaicite:3]{index=3}

**d_calendário**

A dimensão `d_calendário` foi criada utilizando DAX com a função `CALENDAR()`, conforme solicitado.

A tabela contém campos derivados da data, como:

- Date
- Ano
- Mês
- Dia
- Dia da Semana

A dimensão calendário permite realizar análises temporais e facilita a organização dos dados por diferentes períodos.
