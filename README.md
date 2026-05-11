# 🚀 Migração Enterprise: SQL Server → PostgreSQL com Babelfish + AWS DMS

## 📌 Visão Geral

Este projeto demonstra uma estratégia enterprise de modernização de banco de dados utilizando SQL Server, PostgreSQL, Babelfish e AWS Database Migration Service (AWS DMS).

A proposta da solução é permitir uma migração incremental e de baixo risco de workloads legados SQL Server para PostgreSQL, reduzindo dependência de licenciamento proprietário e minimizando impactos na camada de aplicação.

O laboratório foi construído com foco em:

* Reprodutibilidade
* Automação
* Validação técnica
* Simulação de cenários reais de migração
* Preparação para ambientes cloud-native

---

# 🎯 Problema de Negócio

Muitas empresas ainda dependem fortemente de ambientes Microsoft SQL Server legados, enfrentando desafios como:

* Alto custo de licenciamento
* Vendor lock-in
* Dificuldade de escalabilidade
* Risco elevado em migrações tradicionais
* Dependência de aplicações escritas em T-SQL
* Baixa flexibilidade para modernização cloud-native

Migrar diretamente aplicações legadas para PostgreSQL normalmente exige:

* Reescrita de queries
* Refatoração da aplicação
* Ajustes em procedures e funções
* Longas janelas de indisponibilidade

---

# 🧠 Solução Proposta

A arquitetura proposta utiliza serviços e tecnologias que permitem modernização progressiva da camada de dados sem necessidade imediata de reescrita da aplicação.

## 🔧 Componentes Principais

| Tecnologia         | Objetivo                    |
| ------------------ | --------------------------- |
| SQL Server 2019    | Banco de origem             |
| Docker             | Ambiente local reproduzível |
| AdventureWorks2019 | Base de testes corporativa  |
| AWS DMS            | Migração e CDC              |
| PostgreSQL         | Banco de destino            |
| Babelfish          | Compatibilidade T-SQL       |
| GitHub Actions     | Automação CI/CD             |

---

# 🏗️ Arquitetura da Solução

```text
SQL Server (Origem)
        │
        ▼
AWS DMS (CDC)
        │
        ▼
Aurora PostgreSQL + Babelfish
        │
        ▼
Aplicações Legadas (sem reescrita)
```

---

# 🔄 Estratégia de Migração

A estratégia foi dividida em fases progressivas para reduzir riscos operacionais.

## 📍 Fase 1 — Ambiente Local Containerizado (Atual)

### ✔ Implementado

* SQL Server 2019 em container Docker
* Restore do banco AdventureWorks2019
* Execução de comandos T-SQL
* Estruturação inicial do repositório
* Validações de integridade
* Testes operacionais do banco
* Simulação de ambiente enterprise

---

## 📍 Fase 2 — Refatoração e Automação (Atual)

### ✔ Implementado

* Refatoração estrutural do projeto
* Organização modular de diretórios
* Separação de scripts por responsabilidade
* Criação de scripts de validação
* Automatização de verificações técnicas
* Preparação para pipelines CI/CD
* Hardening operacional da POC

---

## 📍 Fase 3 — AWS Database Migration Service (Planejado)

### 🚧 Em andamento

* Replicação Full Load
* Change Data Capture (CDC)
* Migração contínua
* Minimização de downtime
* Simulação de migração enterprise

---

## 📍 Fase 4 — Babelfish for PostgreSQL (Planejado)

### 🚧 Planejado

* Compatibilidade T-SQL
* Migração sem reescrita imediata
* Redução de impacto na aplicação
* Modernização gradual da camada de dados

---

## 📍 Fase 5 — Arquitetura Cloud-Native (Planejado)

### 🚧 Planejado

* Amazon S3 para staging
* Aurora PostgreSQL
* AWS DMS Replication Instance
* Observabilidade com CloudWatch
* Provisionamento com Terraform
* CI/CD completo

---

# 🐳 Ambiente Local Implementado

O laboratório executa atualmente um ambiente SQL Server totalmente containerizado utilizando Docker.

## 🔧 Componentes configurados

* SQL Server 2019
* Docker Compose
* Banco AdventureWorks2019
* Scripts de restore
* Scripts de validação
* Estrutura modular de diretórios

---

# 📦 Processo de Restore do Banco

O banco AdventureWorks2019 foi restaurado utilizando restore nativo do SQL Server.

## 🔄 Fluxo executado

1. Upload do arquivo `.bak`
2. Criação do diretório de backup
3. Execução de `RESTORE FILELISTONLY`
4. Mapeamento de arquivos MDF/LDF
5. Execução do restore com `WITH MOVE`
6. Validação do estado ONLINE

---

## 🧪 Exemplo de Restore

```sql
RESTORE DATABASE AdventureWorks2019
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2019.bak'
WITH
MOVE 'AdventureWorks2019' TO '/var/opt/mssql/data/AdventureWorks2019.mdf',
MOVE 'AdventureWorks2019_log' TO '/var/opt/mssql/data/AdventureWorks2019_log.ldf',
REPLACE,
STATS = 10;
```

---

# 🔎 Validações Técnicas Executadas

Após o restore, foram realizadas validações operacionais e estruturais do ambiente.

## ✔ Validações implementadas

* Verificação do estado do banco
* Consulta em `sys.databases`
* Inspeção de schemas
* Exploração de tabelas
* Validação de objetos do sistema
* Execução de queries OLTP
* Verificação de integridade pós-restore

---

# 🧪 Testes Automatizados

Foram implementados scripts automatizados para validação da infraestrutura e do banco de dados.

## ✔ Objetivos dos testes

* Validar disponibilidade do container
* Verificar status do SQL Server
* Confirmar disponibilidade do banco
* Validar objetos restaurados
* Garantir consistência do ambiente

---

# ⚙️ Estrutura do Projeto

```text
migration-poc/
├── docs/
│
├── scripts/
│   ├── restore/
│   ├── validation/
│   └── reporting/
│
├── reports/
│   └── assessment/
│
├── tests/
│
├── docker-compose.yml
│
└── README.md
```

---

# 🔄 Automação CI/CD

O projeto começou a ser preparado para integração contínua utilizando GitHub Actions.

## 🎯 Objetivos da pipeline

* Validar inicialização do container
* Executar verificações automatizadas
* Detectar falhas de infraestrutura
* Garantir reprodutibilidade
* Automatizar validações da POC

---

# ☁️ Roadmap Cloud

## Próximos passos planejados

* Integração AWS DMS
* Aurora PostgreSQL
* Babelfish
* CDC em tempo real
* Terraform
* Observabilidade
* Métricas operacionais
* Pipeline DevOps completa

---

# 🧠 Decisões Técnicas

| Decisão          | Motivo                  |
| ---------------- | ----------------------- |
| Docker           | Ambiente reproduzível   |
| SQL Server local | Simulação realista      |
| AdventureWorks   | Base enterprise oficial |
| Babelfish        | Compatibilidade T-SQL   |
| AWS DMS          | Migração contínua       |
| GitHub Actions   | Automação operacional   |

---

# 🚀 Competências Demonstradas

Este projeto demonstra conhecimentos em:

* SQL Server Administration
* Docker
* T-SQL
* Restore e Recovery
* Organização de repositórios
* Refatoração estrutural
* DevOps
* CI/CD
* Automação de testes
* Estratégias de migração
* PostgreSQL
* AWS Migration
* Cloud Architecture

---

# 📌 Status Atual do Projeto

| Item                   | Status          |
| ---------------------- | --------------- |
| SQL Server Dockerizado | ✔ Concluído     |
| Restore AdventureWorks | ✔ Concluído     |
| Exploração de dados    | ✔ Concluído     |
| Scripts de validação   | ✔ Concluído     |
| Refatoração estrutural | ✔ Concluído     |
| Testes automatizados   | ✔ Concluído     |
| Preparação para CI/CD  | ✔ Concluído     |
| AWS DMS                | 🚧 Em andamento |
| Babelfish              | 🚧 Planejado    |
| Aurora PostgreSQL      | 🚧 Planejado    |

---

# 📚 Objetivo Educacional

Este laboratório foi desenvolvido com objetivo de aprofundar conhecimentos em:

* Modernização de bancos de dados
* Estratégias de migração enterprise
* Arquiteturas híbridas
* DevOps aplicado a banco de dados
* Cloud Computing
* Engenharia de Plataforma
* Arquiteturas resilientes e reproduzíveis

---

# 👨‍💻 Autor

Projeto desenvolvido para fins de estudo, laboratório técnico e evolução profissional em arquitetura de dados, cloud e engenharia de software.
* Formação AWS 5.0
* 