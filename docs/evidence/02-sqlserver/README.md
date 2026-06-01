# Evidência 02 — Validação do SQL Server de Origem

Esta pasta contém as evidências técnicas relacionadas à preparação, execução e validação do SQL Server utilizado como banco de origem na POC de migração para PostgreSQL com Babelfish.

## Objetivo

Comprovar que o ambiente SQL Server de origem está disponível, funcional e preparado para as etapas de assessment, migração de schema, carga de dados e validação pós-migração.

## Escopo da Validação

Foram validados os seguintes itens:

- execução do container SQL Server;
- disponibilidade do serviço SQL Server;
- validação da versão do SQL Server;
- download do backup AdventureWorksLT2019;
- cópia do backup para o container;
- validação do arquivo de backup com `RESTORE FILELISTONLY`;
- restauração do banco AdventureWorksLT2019;
- validação do banco restaurado em estado online;
- validação das tabelas do banco de origem;
- preparação para análise de compatibilidade com Babelfish.

## Arquivos de Evidência

| Evidência | Descrição | Status |
|---|---|---|
| `sqlserver-running` | Comprova que o SQL Server está em execução | ✅ Validado |
| `sqlserver-version-validation` | Comprova a versão do SQL Server utilizada na POC | ✅ Validado |
| `docker-sqlserver-container-running` | Comprova que o container do SQL Server está ativo no Docker | ✅ Validado |
| `adventureworkslt2019-download-success` | Comprova o download do backup AdventureWorksLT2019 | ✅ Validado |
| `adventureworkslt2019-download-validation` | Comprova a validação do arquivo baixado | ✅ Validado |
| `adventureworkslt2019-backup-copied-container` | Comprova que o backup foi copiado para dentro do container SQL Server | ✅ Validado |
| `adventureworks-filelistonly-validation` | Comprova a leitura da estrutura interna do backup | ✅ Validado |
| `adventureworkslt2019-restore-filelistonly` | Comprova a validação prévia do restore via `FILELISTONLY` | ✅ Validado |
| `adventureworkslt2019-restore-success` | Comprova que o restore do banco foi executado com sucesso | ✅ Validado |
| `adventureworks-restore-success` | Evidência complementar do restore executado | ✅ Validado |
| `adventureworks-database-online` | Comprova que o banco AdventureWorks está online | ✅ Validado |
| `adventureworkslt2019-database-online` | Comprova que o banco AdventureWorksLT2019 está online após o restore | ✅ Validado |
| `adventureworkslt2019-table-validation` | Comprova a existência e validação das tabelas do banco restaurado | ✅ Validado |
| `babelfish-compass-assessment-start` | Registra o início da preparação para assessment de compatibilidade com Babelfish | ✅ Validado |
| `postgresql-pgdump-validation` | Evidência complementar relacionada ao ambiente PostgreSQL/destino | ✅ Validado |

## Resultado da Validação

O SQL Server de origem foi validado com sucesso. O banco AdventureWorksLT2019 foi restaurado, colocado em estado online e teve suas tabelas verificadas.

Essa etapa estabelece a linha de base técnica necessária para as próximas fases da POC:

- execução do Babelfish Compass;
- validação de compatibilidade T-SQL;
- migração de schema;
- validação de carga de dados;
- comparação entre origem e destino;
- preparação para futura implementação com AWS DMS.

## Conclusão

A etapa de validação do SQL Server de origem foi concluída com sucesso.

O ambiente está apto para seguir para a próxima fase da POC: assessment de compatibilidade com Babelfish e validação dos objetos T-SQL.
