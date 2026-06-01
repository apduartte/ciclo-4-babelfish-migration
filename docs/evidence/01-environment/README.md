# Evidência 01 — Configuração do Ambiente Local

Esta pasta contém as evidências técnicas relacionadas ao ambiente local utilizado na POC de migração com Babelfish.

## Objetivo

Validar que o ambiente de desenvolvimento local está pronto para executar a prova de conceito de migração do SQL Server para PostgreSQL/Babelfish.

## Arquivos de Evidência

| Evidência | Descrição | Status |
|---|---|---|
| docker-version | Confirma que o Docker está instalado e disponível no ambiente local | ✅ Validado |
| docker-containers-running | Confirma que os containers necessários estão em execução com sucesso | ✅ Validado |
| wsl-docker-sqlserver | Confirma a integração entre WSL, Docker e SQL Server no ambiente local | ✅ Validado |

## Escopo da Validação

Os seguintes componentes foram validados:

- Docker Desktop;
- integração com WSL;
- container do SQL Server;
- container do PostgreSQL/Babelfish;
- runtime local de containers;
- prontidão básica do ambiente.

## Conclusão

O ambiente local está pronto para suportar as próximas fases da POC de migração, incluindo validação do SQL Server de origem, assessment de compatibilidade com Babelfish, migração de schema e validação de dados.
