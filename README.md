---# 🚀 POC de Modernização SQL Server com PostgreSQL e Babelfish

## Migração e Modernização de Workloads SQL Server para PostgreSQL em Ambiente Cloud

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![Babelfish](https://img.shields.io/badge/Babelfish-Compatible-green)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-red)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHub_Actions-black)

---

## 📋 Resumo Executivo

Este projeto apresenta uma Prova de Conceito (POC) para modernização de  bancos
de dados Microsoft SQL Server utilizando PostgreSQL e Babelfish, com foco na
redução de custos de licenciamento, diminuição da dependência de tecnologias
 proprietárias e preparação para ambientes cloud-native.

A iniciativa avalia a viabilidade técnica da migração, compatibilidade com
aplicações legadas, estratégias de rollback, automação de infraestrutura e
práticas modernas de DevSecOps.

## Documentação

|          Área         |          Descrição             |
|-----------------------|--------------------------------|
| Arquitetura           | Solução alvo e topologia       |
| Segurança             | IAM, KMS, OIDC, SAST           |
| Operações             | Backup, Restore, Monitoramento |
| Migração              | Estratégia e execução          |
| Rollback              | Procedimentos de reversão      |
| Evidências            | Execução da POC                |

---

### 🧭 Jornada da Modernização: AS-IS → POC → TO-BE

Esta POC foi estruturada para demonstrar, de forma controlada e rastreável, uma
jornada de modernização de banco de dados partindo de um cenário legado baseado
em SQL Server até uma arquitetura moderna com PostgreSQL, Babelfish, automação,
segurança e preparação para AWS.

---

## 1️⃣ Cenário Atual — AS-IS

O cenário atual representa um ambiente legado baseado em Microsoft SQL Server,
comum em organizações que possuem aplicações críticas dependentes de tecnologias
proprietárias.

Nesse modelo, as aplicações geralmente dependem de:

- Microsoft SQL Server;
- T-SQL;
- stored procedures;
- protocolo TDS;
- drivers SQL Server;
- licenciamento proprietário;
- operação tradicional;
- baixa automação de validações;
- maior dependência de infraestrutura específica.

### Principais Desafios

| Desafio                    |                     Impacto                    |
|----------------------------|------------------------------------------------|
| Alto custo de licenciamento| Aumenta o TCO da solução                       |
| Vendor lock-in             | Reduz flexibilidade tecnológica                |
| Migração complexa          | Exige planejamento, assessment e validação     |
| Dependência de T-SQL       | Pode dificultar migração direta para PostgreSQL|
| Risco operacional          | Pode gerar downtime ou inconsistência de dados |
| Baixa automação            | Dificulta auditoria, rollback e rastreabilidade|

---

## 2️⃣ POC de Modernização — TRANSITION

A POC tem como objetivo validar uma abordagem de modernização progressiva,
utilizando PostgreSQL com Babelfish para reduzir o impacto inicial da migração
de workloads SQL Server.

Nesta etapa, o ambiente foi preparado para validar:

- execução local com Docker;
- SQL Server 2022 como banco de origem;
- PostgreSQL/Babelfish como destino;
- restore do banco AdventureWorksLT2019;
- conectividade via protocolo TDS;
- compatibilidade inicial com comandos T-SQL;
- geração de evidências técnicas;
- preparação para assessment com Babelfish Compass;
- preparação para futura migração com AWS DMS;
- automação e rastreabilidade via GitHub.

### Componentes da POC

|          Componente          |         Finalidade                       |
|------------------------------|------------------------------------------|
| Docker Desktop               | Execução local dos containers            |
| SQL Server 2022              | Banco de origem da migração              |
| PostgreSQL 15                | Banco de destino open source             |
| Babelfish                    | Camada de compatibilidade T-SQL/TDS      |
| AdventureWorksLT2019         | Base de referência para validação        |
| Babelfish Compass            | Assessment de compatibilidade            |
| GitHub Actions               | Automação de validações                  |
| Terraform                    | Provisionamento futuro da infraestrutura |
| AWS DMS                      | Migração controlada de dados             |

---

## 3️⃣ Resultado Final Esperado — TO-BE

O resultado final esperado é uma arquitetura modernizada, preparada para
execução em ambiente cloud, com menor dependência de licenciamento proprietário,
maior rastreabilidade operacional e validações automatizadas.

O cenário TO-BE prevê:

- PostgreSQL com Babelfish como destino da modernização;
- migração controlada com AWS DMS;
- infraestrutura provisionada via Terraform;
- segurança com IAM, Secrets Manager e KMS;
- observabilidade com CloudWatch;
- validações automatizadas no pipeline;
- documentação técnica versionada;
- estratégia de rollback;
- evidências organizadas por fase;
- redução de risco na jornada de migração.

### Benefícios Esperados

|Benefício                |     Resultado             |
|-------------------------|---------------------------|
| Redução de dependência  | Menor lock-in tecnológico |
|proprietária             |                           |
| Modernização progressiva| Menor refatoração imediata|
| Compatibilidade com     | Preservação inicial de    |
|aplicações legadas       |T-SQL/TDS                  |
| Automação operacional   | Rastreabilidade e menor   |
|                         | erro manual               |
| Infraestrutura como     | Ambientes reproduzíveis   |
| Código                  |                           |
| Segurança cloud-native  | Melhor controle de acesso |
|                         | e auditoria               |
| Migração controlada     | Menor risco operacional   |
| Preparação para escala  | Base pronta para evolução |
|                         | em AWS                    |

## 📌 Resumo Executivo da Jornada

```text
AS-IS
SQL Server legado
T-SQL
Licenciamento proprietário
Operação tradicional
Baixa automação

        ↓

POC
Docker
SQL Server 2022
PostgreSQL + Babelfish
AdventureWorksLT2019
Assessment de compatibilidade
Evidências técnicas

        ↓

TO-BE
PostgreSQL/Babelfish em AWS
AWS DMS
Terraform
DevSecOps
CloudWatch
Rollback planejado
Validação automatizada

## 🧠 Contexto de Negócio e Problema Técnico

Em cenários tradicionais, migrar diretamente para PostgreSQL pode exigir:

- Reescrita de consultas SQL;
- Refatoração de procedures;
- Alterações na aplicação;
- Longos ciclos de homologação.

Esta POC busca validar uma abordagem que reduza esses impactos utilizando o
Babelfish for PostgreSQL.

---

## 🏗️ Solução Avaliada

A arquitetura proposta utiliza:

- PostgreSQL 15
- Babelfish for PostgreSQL
- AWS Database Migration Service (AWS DMS)
- Docker
- Terraform
- GitHub Actions
- Práticas DevSecOps

O objetivo é permitir uma migração gradual dos workloads SQL Server, preservando
compatibilidade com aplicações existentes e reduzindo riscos operacionais.

---

## 🏆 Resultados Obtidos

### Validações Concluídas

- Ambiente SQL Server 2022 provisionado e validado;
- Ambiente PostgreSQL 15 provisionado e validado;
- Babelfish instalado e operacional;
- Restore do banco AdventureWorksLT2019 realizado com sucesso;
- Conectividade TDS validada;
- Operações T-SQL básicas testadas;
- Estratégia de backup e recuperação validada;
- Estrutura de evidências técnicas implementada.

### Em Andamento

- Assessment de compatibilidade com Babelfish Compass;
- Validação de objetos incompatíveis;
- Estratégia de remediação;
- Testes controlados de migração.

### Planejado

- Implementação do AWS DMS;
- Provisionamento da infraestrutura AWS via Terraform;
- Automação completa do ambiente;
- Testes de performance e escalabilidade.

---

## 🧠 Competências Demonstradas

## Cloud Computing

- Amazon Web Services (AWS)
- Arquitetura Cloud
- Modernização de Workloads
- Infraestrutura como Código

## Engenharia de Dados e Banco de Dados

- SQL Server
- PostgreSQL
- Babelfish
- Estratégias de Migração
- Backup e Recuperação
- Validação de Integridade

## DevOps e DevSecOps

- Docker
- GitHub Actions
- CI/CD
- Automação Operacional
- Hardening de Ambiente
- Segurança Integrada ao Ciclo de Entrega

## Engenharia de Plataforma

- Troubleshooting
- Documentação Técnica
- Gestão de Riscos
- Estratégias de Rollback
- Governança Operacional

---

## 🏛️ Visão Geral da Arquitetura

## Fluxo de Modernização

```text
SQL Server
     │
     ▼
Babelfish Compass
     │
     ▼
Avaliação de Compatibilidade
     │
     ▼
AWS DMS
     │
     ▼
PostgreSQL + Babelfish
     │
     ▼
Validação da Aplicação
```

## Ambiente da POC

```text
Windows 11
    │
    ▼
WSL2 Ubuntu 24.04
    │
    ▼
Docker Desktop
    │
    ├── SQL Server 2022
    └── PostgreSQL 15 + Babelfish
```

---

## 📂 Estrutura do Projeto

```text
backup/
docker/
docs/
├── architecture/
├── evidence/
├── migration-strategy/
├── operations/
├── security/
├── troubleshooting/
└── grc/

infra/
terraform/
scripts/
tests/

.github/workflows/
```

---

## 🔄 Estratégia de Migração

A migração foi estruturada em cinco fases principais.

## 1. Assessment

Avaliação prévia da compatibilidade entre SQL Server e Babelfish.

Atividades:

- Execução do Babelfish Compass;
- Identificação de incompatibilidades;
- Avaliação de riscos;
- Planejamento de remediações.

## 2. Preparação do Ambiente

Atividades:

- Provisionamento da infraestrutura;
- Configuração dos ambientes;
- Hardening de segurança;
- Validação de backups;
- Configuração de monitoramento.

## 3. Migração dos Dados

Atividades:

- Carga inicial dos dados;
- Configuração de replicação;
- Sincronização entre origem e destino;
- Planejamento do cutover.

## 4. Validação Pós-Migração

Atividades:

- Reconciliação de dados;
- Testes funcionais;
- Validação de consultas críticas;
- Verificação de integridade.

## 5. Estratégia de Rollback

Atividades:

- Preservação do ambiente original;
- Procedimentos documentados de reversão;
- Recuperação controlada dos serviços;
- Minimização de indisponibilidade.

---

## 🔐 Segurança e Governança

A segurança foi considerada desde a concepção da solução.

Controles avaliados:

- Princípio do Menor Privilégio (Least Privilege);
- IAM Roles;
- AWS Systems Manager (SSM);
- Gerenciamento seguro de credenciais;
- Criptografia de dados em trânsito e em repouso;
- Logs auditáveis;
- CloudTrail;
- CloudWatch;
- Estratégias de backup e recuperação.

## Administração Segura com AWS Systems Manager

A arquitetura elimina a necessidade de acesso SSH público às instâncias.

Benefícios:

- Sem exposição da porta 22;
- Sem utilização de arquivos PEM;
- Autenticação baseada em IAM;
- Sessões auditáveis;
- Menor superfície de ataque;
- Maior aderência às boas práticas AWS.

---

### Benefícios Esperados

- **Redução de dependência:** menor lock-in tecnológico.
- **Modernização progressiva:** menor necessidade de refatoração imediata.
- **Compatibilidade com legados:** preservação inicial de T-SQL/TDS.
- **Automação operacional:** mais rastreabilidade e menor erro manual.
- **Infraestrutura como Código:** ambientes reproduzíveis.
- **Segurança cloud-native:** melhor controle de acesso e auditoria.
- **Migração controlada:** menor risco operacional.
- **Preparação para escala:** base pronta para evolução em AWS.

A estratégia de modernização proporciona:

- Redução de custos de licenciamento;
- Menor dependência de tecnologias proprietárias;
- Migração gradual e controlada;
- Redução de riscos operacionais;
- Maior preparação para ambientes cloud-native;
- Melhor governança e rastreabilidade;
- Maior flexibilidade tecnológica.

---

## 📂 Evidências Técnicas

As evidências foram organizadas por etapa do processo de migração:

```text
docs/evidence/

01-environment/
02-sqlserver/
03-compass/
04-assessment/
05-remediation/
06-migration/
07-validation/
08-rollback/
```

Essa organização garante rastreabilidade, auditoria e reprodução dos testes executados.

---

## 📌 Status Atual

| Etapa               | Status          |
| ------------------- | ----------------|
| Ambiente Docker     | ✅ Concluído    |
| SQL Server 2022     | ✅ Concluído    |
| PostgreSQL 15       | ✅ Concluído    |
| Babelfish           | ✅ Concluído    |
| Backup e Restore    | ✅ Concluído    |
| Assessment Compass  | 🔄 Em andamento |
| Migração Controlada | 🔄 Em andamento |
| AWS DMS             | ⏳ Planejado    |
| Terraform           | ⏳ Planejado    |
| Arquitetura AWS     | ⏳ Planejado    |

---

## 🚀 Próximos Passos

- Finalizar assessment com Babelfish Compass;
- Executar migração de schema;
- Validar migração dos dados;
- Realizar testes de performance;
- Implementar AWS DMS;
- Provisionar infraestrutura AWS via Terraform;
- Automatizar validações pós-migração;
- Publicar arquitetura de referência em AWS.

---

## 🎯 Conclusão

Esta POC demonstra uma abordagem estruturada para modernização de workloads
Microsoft SQL Server utilizando PostgreSQL e Babelfish.

O projeto valida aspectos técnicos, operacionais e arquiteturais necessários
para iniciativas de transformação digital, reduzindo riscos de migração e
criando uma base sólida para adoção de soluções cloud-native.

Além da validação tecnológica, a iniciativa demonstra práticas de arquitetura,
governança, automação, segurança e documentação técnica alinhadas aos desafios
encontrados em ambientes corporativos.
