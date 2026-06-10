# Evidências de Validação da Migração

## Objetivo

Esta documentação apresenta as evidências da fase de validação da Prova de Conceito (POC) de migração utilizando Babelfish for PostgreSQL.

O objetivo desta etapa é confirmar que o ambiente está operacional, que consultas básicas podem ser executadas com sucesso e que existe evidência de backup lógico do ambiente PostgreSQL/Babelfish.

## Evidências Disponíveis

### Consulta de Clientes

**Arquivo:**

`adventureworkslt2019-customer-query-validation.png`

Evidência da execução de consulta na tabela `SalesLT.Customer`, com retorno de registros da base AdventureWorksLT2019.

### Backup PostgreSQL

**Arquivo:**

`postgresql-pgdump-validation.png`

Evidência da geração e validação do backup lógico PostgreSQL utilizando `pg_dump`.

**Status da Validação:** ✅ Concluída

## Escopo da Validação

A validação contempla:

* Execução de consulta na base AdventureWorksLT2019;
* Retorno de dados reais da tabela `SalesLT.Customer`;
* Validação operacional do ambiente SQL Server;
* Validação da execução do `pg_dump` no ambiente PostgreSQL/Babelfish;
* Registro visual das evidências técnicas.

## Consulta Validada

A evidência de consulta demonstra a execução do seguinte comando SQL:

```sql
USE AdventureWorksLT2019;
GO

SELECT TOP 10
    FirstName,
    LastName,
    CompanyName
FROM SalesLT.Customer;
GO
```

O resultado retornou 10 registros da tabela `SalesLT.Customer`, demonstrando acesso bem-sucedido aos dados da base AdventureWorksLT2019.

## Validação do Backup PostgreSQL

A evidência de `pg_dump` demonstra a geração de backup lógico no ambiente PostgreSQL/Babelfish.

Essa validação contribui para comprovar:

* Conectividade com o container PostgreSQL/Babelfish;
* Funcionamento operacional do banco;
* Capacidade de geração de backup lógico;
* Preparação para cenários de recuperação e rollback.

## Avaliação Técnica

As evidências disponíveis demonstram que a fase de validação possui cobertura suficiente para uma POC técnica.

Foram comprovados:

* Acesso à base de dados;
* Execução de consulta SQL;
* Retorno de dados reais;
* Geração de backup lógico PostgreSQL;
* Registro visual das validações executadas.

## Melhorias Futuras

Como evolução da POC, recomenda-se incluir:

* Comparação de quantidade de registros entre origem e destino;
* Comparação de schemas entre SQL Server e Babelfish;
* Validação de consultas equivalentes nos dois ambientes;
* Observações básicas de desempenho;
* Evidências adicionais de rollback.

## Conclusão

A fase de validação está documentada e possui evidências suficientes para demonstrar que o ambiente foi validado em nível operacional.

Para fins de portfólio técnico, esta etapa fortalece a POC ao evidenciar que o projeto não se limitou ao assessment, mas também contemplou validação pós-migração e preparação para continuidade operacional.
