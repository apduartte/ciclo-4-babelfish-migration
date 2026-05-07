# 🚀 Enterprise Migration: SQL Server → PostgreSQL (Babelfish + AWS DMS)

## 📌 Overview

This project demonstrates an enterprise-grade architecture for migrating legacy SQL Server workloads to PostgreSQL using Babelfish and AWS Database Migration Service (DMS).

The solution enables **incremental migration with near-zero downtime**, allowing organizations to modernize their database layer without rewriting existing applications.

---

## 🎯 Problem Statement

Legacy SQL Server systems introduce:

- High licensing costs
- Strong vendor lock-in
- Risky full rewrite migrations
- Limited cloud-native scalability

---

## 🧠 Solution Overview

This implementation introduces:

- **Babelfish for PostgreSQL** → Enables T-SQL compatibility
- **AWS DMS** → Continuous Data Capture (CDC) for live migration
- **Amazon RDS (PostgreSQL)** → Managed database target
- **Amazon S3** → Intermediate storage (optional)
- **Docker** → Local simulation environment

---

## 🏗️ Architecture

SQL Server (Source)
│
▼
AWS DMS (CDC)
│
▼
Amazon RDS (PostgreSQL + Babelfish)
│
▼
Application Layer (unchanged)


---

## 🔄 Migration Strategy

1. Full load migration using AWS DMS
2. Enable CDC (Change Data Capture)
3. Redirect application to Babelfish endpoint
4. Gradual decommission of SQL Server

---

## ⚙️ How to Run (Local Simulation)

```bash
# Start containers
docker-compose up -d --build

# Access application
http://localhost:8080

📂 Project Structure
.
├── docs/
├── scripts/
├── docker-compose.yml
└── README.md

🎯 Key Benefits
Zero/low downtime migration
No need to rewrite application layer
Cost reduction (SQL Server → PostgreSQL)
Cloud-native readiness

🧠 Technical Decisions

| Decision  | Reason                     |
| --------- | -------------------------- |
| Babelfish | Avoid rewriting T-SQL      |
| AWS DMS   | Reliable CDC pipeline      |
| Docker    | Reproducible local testing |

🚀 Future Improvements
CI/CD with GitHub Actions
Terraform for infra provisioning
Observability with CloudWatch


---
## 🧱 Infraestrutura Implementada (Estado Atual)

O projeto atualmente executa um ambiente local containerizado com SQL Server 2019 utilizando Docker.

### 🐳 Componentes implementados:

- SQL Server rodando em container Docker
- Restore do banco AdventureWorks2019
- Execução via `sqlcmd`
- Validação de integridade pós-restore
- Estrutura de diretórios padronizada para migração

---

## 📦 Processo de Restore Executado

O banco de dados foi restaurado com sucesso a partir de um arquivo `.bak` utilizando o seguinte fluxo:

1. Cópia do arquivo AdventureWorks para o container
2. Criação do diretório de backup no SQL Server
3. Execução de `RESTORE FILELISTONLY` para análise de arquivos lógicos
4. Execução do `RESTORE DATABASE` com `WITH MOVE`
5. Validação do estado ONLINE do banco

Exemplo:

```sql
RESTORE DATABASE AdventureWorks2019
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2019.bak'
WITH
MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf',
MOVE 'AdventureWorks2019_log' TO '/var/opt/mssql/data/AdventureWorks2019_log.ldf',
REPLACE,
STATS = 10;

🔎 Validações Técnicas Realizadas
Consulta em sys.databases para validação do restore
Exploração de schemas via sys.tables e sys.schemas
Execução de queries OLTP para validação de dados reais
Inspeção de objetos do sistema

☁️ Arquitetura Alvo (AWS Migration Roadmap)

Este laboratório está sendo evoluído para um cenário real de migração:

Fase 1 — Ambiente Local (Atual)
SQL Server em Docker
Restore de backup AdventureWorks
Validação de dados

Fase 2 — AWS DMS
Migração de dados SQL Server → AWS
Replicação contínua
Minimização de downtime
Fase 3 — Babelfish for Aurora PostgreSQL
Execução de T-SQL em PostgreSQL engine
Compatibilidade com aplicações legadas

Fase 3 — Babelfish for Aurora PostgreSQL
Execução de T-SQL em PostgreSQL engine
Compatibilidade com aplicações legadas
Fase 4 — Arquitetura Cloud-Native
Amazon S3 (staging)
AWS DMS replication instance
Aurora PostgreSQL + Babelfish
Observabilidade com CloudWatch

📌 Status do Projeto

✔ Infraestrutura local funcional
✔ Restore de banco validado
✔ Exploração de dados executada
✔ Base preparada para integração com AWS


