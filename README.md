# 🚀 Plataforma de Migração SQL Server → PostgreSQL com Babelfish

Modernização de workloads SQL Server utilizando PostgreSQL, Babelfish, AWS DMS e práticas DevSecOps.

---

# 📌 Visão Geral

Este projeto demonstra uma estratégia de modernização de bancos de dados SQL Server para PostgreSQL utilizando:

* Babelfish for PostgreSQL;
* AWS Database Migration Service (AWS DMS);
* pipelines DevSecOps;
* automação operacional;
* validações pós-migração.

A proposta busca reduzir:

* dependência de licenciamento Microsoft;
* risco operacional;
* downtime durante migração;
* necessidade imediata de refatoração das aplicações legadas.

---

# 🎯 Objetivos do Projeto

A POC foi construída para validar:

* compatibilidade T-SQL via Babelfish;
* conectividade TDS;
* migração controlada SQL Server → PostgreSQL;
* readiness para AWS DMS;
* rollback operacional;
* validação pós-migração;
* automação de evidências técnicas.

---

# 🧠 Cenário de Negócio

Muitas organizações ainda operam workloads críticos em Microsoft SQL Server e enfrentam desafios como:

* alto custo de licenciamento;
* vendor lock-in;
* baixa flexibilidade operacional;
* dificuldades de escalabilidade;
* risco elevado em migrações tradicionais.

Em ambientes legados, aplicações frequentemente dependem de:

* T-SQL;
* procedures;
* drivers SQL Server;
* protocolo TDS.

Migrar diretamente para PostgreSQL normalmente exige:

* reescrita de código;
* refatoração de procedures;
* alterações na camada de aplicação;
* longas janelas de indisponibilidade.

---

# 🐳 Arquitetura Local da POC

A prova de conceito foi implementada em ambiente containerizado utilizando:

* Windows 11;
* WSL2;
* Ubuntu 24.04;
* Docker Desktop;
* SQL Server 2022;
* PostgreSQL 15;
* Babelfish;
* sqlcmd.

```text
Windows Host
    ↓
WSL2 Ubuntu
    ↓
Docker Desktop
    ↓
Containers Docker
    ├── SQL Server 2022
    └── PostgreSQL + Babelfish
```

---

# ✅ Ambiente Provisionado

| Componente      | Status |
| --------------- | ------ |
| WSL2            | ✅      |
| Ubuntu 24.04    | ✅      |
| Docker Desktop  | ✅      |
| SQL Server 2022 | ✅      |
| PostgreSQL 15   | ✅      |
| Babelfish       | ✅      |
| sqlcmd          | ✅      |
| Porta 1433      | ✅      |
| Porta 5432      | ✅      |

---

# ✅ SQL Server — Testes Validados

| Teste             | Resultado |
| ----------------- | --------- |
| Conectividade TDS | ✅         |
| CREATE DATABASE   | ✅         |
| CREATE TABLE      | ✅         |
| INSERT            | ✅         |
| SELECT            | ✅         |
| UPDATE            | ✅         |
| DELETE            | ✅         |
| JOINs             | ✅         |
| Stored Procedures | ✅         |

---

# 🧠 Compatibilidade Babelfish

O Babelfish permite compatibilidade parcial com workloads SQL Server através de:

* protocolo TDS;
* drivers SQL Server;
* sintaxe T-SQL;
* porta 1433;
* integração com aplicações legadas.

Isso reduz significativamente o impacto inicial da migração.

---

# ⚠️ Limitações Conhecidas do Babelfish

Alguns recursos do SQL Server ainda podem exigir refatoração:

* dynamic SQL complexo;
* SQL CLR;
* linked servers;
* Service Broker;
* cursores legados;
* cross-database transactions;
* temp tables complexas.

---

# 💾 Restore do AdventureWorksLT2019

O banco de dados utilizado na POC foi o `AdventureWorksLT2019`, disponibilizado oficialmente pela Microsoft.

---

## 📥 Download do Backup

```bash
curl -L https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2019.bak \
-o sqlserver/backup/AdventureWorksLT2019.bak
```

---

## 📦 Cópia do Backup para o Container

```bash
docker cp sqlserver/backup/AdventureWorksLT2019.bak \
sqlserver-adventureworks:/var/opt/mssql/backup/
```

---

## 🔎 Verificação do Arquivo

```bash
docker exec -it sqlserver-adventureworks \
ls -lh /var/opt/mssql/backup
```

---

## 🛠️ Restore do Banco

```sql
RESTORE DATABASE AdventureWorksLT2019
FROM DISK = '/var/opt/mssql/backup/AdventureWorksLT2019.bak'
WITH
MOVE 'AdventureWorksLT2019_Data'
TO '/var/opt/mssql/data/AdventureWorksLT2019.mdf',

MOVE 'AdventureWorksLT2019_Log'
TO '/var/opt/mssql/data/AdventureWorksLT2019_log.ldf',

REPLACE;
GO
```

---

## ✅ Resultado do Restore

O restore foi concluído com sucesso no SQL Server 2022.

Durante o processo:

* o SQL Server converteu automaticamente o banco da versão interna 904 para 957;
* 858 páginas de dados foram processadas;
* o ambiente foi validado para migração e assessment.

Exemplo do log:

```text
Database 'AdventureWorksLT2019' running the upgrade step from version 956 to version 957.

RESTORE DATABASE successfully processed 858 pages in 1.183 seconds (5.662 MB/sec).
```

---

# 📂 Evidências

As evidências da POC estão organizadas por fases da migração e validação.

```text
docs/evidence/
├── 01-environment/
├── 02-sqlserver/
├── 03-compass/
├── 04-assessment/
├── 05-remediation/
├── 06-migration/
├── 07-validation/
└── 08-rollback/
```

---

# 🔍 Estratégia de Migração

A estratégia foi dividida em fases controladas para garantir segurança, rastreabilidade e minimização de riscos durante a migração.

---

## 1️⃣ Assessment

* Babelfish Compass;
* análise de compatibilidade;
* identificação de riscos.

---

## 2️⃣ Preparação

* configuração do ambiente;
* hardening;
* backup;
* validações iniciais.

---

## 3️⃣ Migração

* Full Load;
* CDC contínuo;
* sincronização controlada;
* cutover planejado.

---

## 4️⃣ Validação

* contagem de registros;
* integridade de dados;
* testes funcionais;
* validação de queries.

---

## 5️⃣ Rollback

* preservação do SQL Server original;
* retorno rápido ao ambiente anterior;
* minimização de downtime.

---

# 🔐 Segurança e Hardening

A arquitetura considera práticas modernas de segurança para garantir proteção, rastreabilidade e conformidade operacional.

---

## 🛡️ Controles de Segurança

* IAM Least Privilege;
* Secrets Manager;
* KMS Encryption;
* backups automatizados;
* logs auditáveis;
* CloudTrail;
* CloudWatch;
* pipelines DevSecOps.

---

# 📊 Benefícios Técnicos

* redução de custos de licenciamento;
* modernização progressiva;
* compatibilidade com aplicações legadas;
* preparação para cloud-native;
* redução de downtime;
* automação operacional;
* observabilidade centralizada.

---

# 🚀 DevSecOps

O projeto utiliza conceitos modernos de automação, segurança e integração contínua.

---

## ⚙️ Práticas Implementadas

* CI/CD;
* GitHub Actions;
* automação de validações;
* Infrastructure as Code;
* versionamento Git;
* segurança shift-left.

---

# 🧱 Estrutura do Projeto

```text
backup/
docker/
docs/
├── architecture/
├── evidence/
├── grc/

scripts/
terraform/
tests/
.github/workflows/
```

---

# 📌 Status Atual do Projeto

| Etapa                    | Status |
| ------------------------ | ------ |
| Ambiente Docker          | ✅      |
| SQL Server 2022          | ✅      |
| PostgreSQL + Babelfish   | ✅      |
| Backup PostgreSQL        | ✅      |
| Restore AdventureWorksLT | ✅      |
| Validação SQL Server     | ✅      |
| Babelfish Compass        | 🔄     |
| Migração                 | 🔄     |
| Validação Pós-Migração   | 🔄     |
| AWS DMS                  | ⏳      |
| Terraform                | ⏳      |

---

# 📌 Próximos Passos

* executar Babelfish Compass;
* validar compatibilidade T-SQL;
* migrar schema;
* validar carga de dados;
* executar testes de performance;
* implementar DMS;
* automatizar validações;
* provisionar infraestrutura via Terraform.

---

# 🎯 Conclusão

Esta POC demonstra uma abordagem moderna para modernização de workloads SQL Server utilizando PostgreSQL e Babelfish.

A arquitetura proposta permite:

* migração progressiva;
* redução de riscos;
* compatibilidade com aplicações existentes;
* menor dependência de tecnologias proprietárias;
* preparação para ambientes cloud-native.

---

O projeto estabelece uma base sólida para cenários enterprise de transformação digital e migração de banco de dados em larga escala.
