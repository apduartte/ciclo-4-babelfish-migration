# 🚀 SQL Server Modernization with PostgreSQL + Babelfish

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![Babelfish](https://img.shields.io/badge/Babelfish-Compatible-green)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-red)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHub_Actions-black)

```text
CI/CD
SAST
Terraform
PostgreSQL
Babelfish
AWS
Docker
```

# 📑 Sumário

- [🚀 SQL Server Modernization with PostgreSQL + Babelfish](#-sql-server-modernization-with-postgresql--babelfish)
- [📑 Sumário](#-sumário)
- [📌 Visão Geral](#-visão-geral)
- [🎯 Objetivos do Projeto](#-objetivos-do-projeto)
- [🧠 Cenário de Negócio](#-cenário-de-negócio)
- [🐳 Arquitetura Local da POC](#-arquitetura-local-da-poc)
- [✅ Ambiente Provisionado](#-ambiente-provisionado)
- [✅ SQL Server — Testes Validados](#-sql-server--testes-validados)
- [🧠 Compatibilidade Babelfish](#-compatibilidade-babelfish)
- [⚠️ Limitações Conhecidas do Babelfish](#️-limitações-conhecidas-do-babelfish)
- [💾 Restore do AdventureWorksLT2019](#-restore-do-adventureworkslt2019)
  - [📥 Download do Backup](#-download-do-backup)
  - [📦 Cópia do Backup para o Container](#-cópia-do-backup-para-o-container)
  - [🔎 Verificação do Arquivo](#-verificação-do-arquivo)
  - [🛠️ Restore do Banco](#️-restore-do-banco)
  - [✅ Resultado do Restore](#-resultado-do-restore)
- [📂 Evidências](#-evidências)
- [🔍 Estratégia de Migração](#-estratégia-de-migração)
  - [1️⃣ Assessment](#1️⃣-assessment)
  - [2️⃣ Preparação](#2️⃣-preparação)
  - [3️⃣ Migração](#3️⃣-migração)
  - [4️⃣ Validação](#4️⃣-validação)
  - [5️⃣ Rollback](#5️⃣-rollback)
- [🔐 Segurança e Hardening](#-segurança-e-hardening)
  - [🛡️ Controles de Segurança](#️-controles-de-segurança)
- [🔐 Segurança e Hardening](#-segurança-e-hardening-1)
  - [🔐 Acesso Seguro AWS com Systems Manager (SSM)](#-acesso-seguro-aws-com-systems-manager-ssm)
    - [Recursos de Segurança](#recursos-de-segurança)
    - [Componentes AWS Utilizados](#componentes-aws-utilizados)
    - [Comandos de Validação](#comandos-de-validação)
    - [Fluxo da Arquitetura](#fluxo-da-arquitetura)
    - [Melhorias DevSecOps Implementadas](#melhorias-devsecops-implementadas)
    - [Benefícios da Implementação](#benefícios-da-implementação)
- [📊 Benefícios Técnicos](#-benefícios-técnicos)
- [🚀 DevSecOps](#-devsecops)
  - [⚙️ Práticas Implementadas](#️-práticas-implementadas)
- [🧱 Estrutura do Projeto](#-estrutura-do-projeto)
- [📂 Estrutura da Documentação](#-estrutura-da-documentação)
- [📌 Status Atual do Projeto](#-status-atual-do-projeto)
- [📌 Próximos Passos](#-próximos-passos)
- [🎯 Conclusão](#-conclusão)
- [📂 Evidências de Validação PostgreSQL](#-evidências-de-validação-postgresql)
  - [🗂️ Estrutura Recomendada de Evidências](#️-estrutura-recomendada-de-evidências)
    - [📁 Evidências Operacionais PostgreSQL](#-evidências-operacionais-postgresql)
  - [Resultado esperado:](#resultado-esperado)
  - [-- PostgreSQL database dump](#---postgresql-database-dump)
  - [📊 Aplicação do 5W2H](#-aplicação-do-5w2h)

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

# 🔐 Segurança e Hardening

## 🔐 Acesso Seguro AWS com Systems Manager (SSM)

Este ambiente utiliza exclusivamente o AWS Systems Manager (SSM) Session Manager para acesso administrativo seguro às instâncias Amazon EC2.

A arquitetura elimina a necessidade de:

- Exposição pública da porta SSH (22)
- Utilização de chaves PEM
- Acesso administrativo tradicional via SSH

### Recursos de Segurança

- Autenticação baseada em IAM Role para EC2
- Credenciais temporárias via AWS STS
- Administração centralizada via Session Manager
- Auditoria centralizada de sessões
- Modelo de segurança Zero Trust
- Redução da superfície de ataque

### Componentes AWS Utilizados

- Amazon EC2
- AWS Systems Manager (SSM)
- Session Manager
- AWS IAM
- AWS STS

### Comandos de Validação

```bash
sudo systemctl status amazon-ssm-agent
aws sts get-caller-identity
```

### Fluxo da Arquitetura

GitHub Actions  
→ OIDC Federation  
→ AWS IAM Role  
→ AWS Systems Manager (SSM)  
→ Session Manager  
→ Amazon EC2  
→ Babelfish/PostgreSQL

### Melhorias DevSecOps Implementadas

- Administração segura sem utilização de SSH
- Controle centralizado de acesso
- Segurança operacional cloud-native
- Melhor rastreabilidade operacional
- Integração segura entre GitHub Actions e AWS
- Conformidade com boas práticas AWS

### Benefícios da Implementação

- Eliminação de acesso SSH público
- Redução significativa da superfície de ataque
- Acesso administrativo baseado em identidade IAM
- Sessões auditáveis e centralizadas
- Ambiente mais seguro para workloads críticos
- Arquitetura alinhada às práticas modernas de DevSecOps
- 
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

# 📂 Estrutura da Documentação

```text
docs/
├── architecture/         # Diagramas e arquitetura da solução
├── evidence/             # Evidências técnicas e screenshots
├── troubleshooting/      # Problemas conhecidos e soluções
├── migration-strategy/   # Estratégias e fases da migração
├── security/             # Hardening, IAM, DevSecOps
├── operations/           # Operação, backup e rollback
└── grc/                  # Governança, risco e compliance
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

---

# 📂 Evidências de Validação PostgreSQL

As evidências relacionadas ao PostgreSQL e às validações pós-migração foram organizadas para garantir rastreabilidade, auditoria técnica e documentação operacional da POC.

---

## 🗂️ Estrutura Recomendada de Evidências

### 📁 Evidências Operacionais PostgreSQL

```text
docs/evidence/02-postgresql/

Diretório responsável por armazenar evidências técnicas relacionadas ao ambiente PostgreSQL/Babelfish, incluindo:

criação de banco;
conectividade PostgreSQL;
validações do container;
execução do pg_dump;
backup lógico;
testes operacionais do PostgreSQL;
validação de serviços ativos.
🖼️ Evidência — PostgreSQL pg_dump Validation

Arquivo sugerido:

postgresql-pgdump-validation.png
📌 Objetivo da Evidência

Documentar a execução bem-sucedida do comando pg_dump no ambiente PostgreSQL containerizado, validando:

integridade do banco migrationlab;
capacidade de geração de backup lógico;
readiness para estratégias de rollback;
preparação para migração e recuperação operacional.

🧠 Contexto Técnico

A validação foi executada no container PostgreSQL utilizado pela POC Babelfish, garantindo que o ambiente esteja apto para:

backup;
restore;
recuperação;
continuidade operacional;
validações pós-migração.
⚙️ Comando Executado
docker exec -t postgres-babelfish \
pg_dump -U postgres migrationlab \
> backup/postgresql/migrationlab-backup.sql
✅ Resultado Validado

✅ Resultado Validado

A evidência confirma:

execução bem-sucedida do pg_dump;
acesso válido ao banco migrationlab;
geração correta do arquivo .sql;
funcionamento operacional do PostgreSQL 15;
preparação do ambiente para migração controlada.
🔍 Evidência Complementar

Validação do conteúdo do backup:

head backup/postgresql/migrationlab-backup.sql

Resultado esperado:
--
-- PostgreSQL database dump
--
## 📊 Aplicação do 5W2H

| Elemento | Descrição |
|----------|------------|
| **What** | Validação de backup lógico PostgreSQL utilizando `pg_dump` |
| **Why** | Garantir integridade, recuperação e readiness operacional |
| **Where** | Container Docker `postgres-babelfish` |
| **When** | Durante a fase de validação da POC |
| **Who** | Equipe responsável pela modernização e migração |
| **How** | Execução do `pg_dump` via container Docker |
| **How Much** | Sem custo adicional, utilizando ferramentas open source |
