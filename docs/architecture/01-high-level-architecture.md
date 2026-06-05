# 01 - High Level Architecture

## Objetivo

Este documento apresenta a Arquitetura de Alto Nível (High Level Architecture - HLA) da Prova de Conceito (PoC) de migração de banco de dados Microsoft SQL Server para Amazon Aurora PostgreSQL utilizando Babelfish.

A arquitetura foi projetada para demonstrar uma estratégia de modernização de ambientes legados, preservando a compatibilidade com aplicações existentes e reduzindo o impacto da migração.

---

# Visão Geral da Solução

A solução proposta utiliza serviços da AWS para disponibilizar uma plataforma escalável, segura e resiliente, permitindo a migração gradual de workloads SQL Server para Aurora PostgreSQL com suporte ao protocolo TDS e linguagem T-SQL através do Babelfish.

Principais objetivos da arquitetura:

* Reduzir dependência de licenciamento SQL Server.
* Demonstrar viabilidade técnica do Babelfish.
* Facilitar futuras iniciativas de modernização.
* Garantir alta disponibilidade e escalabilidade.
* Simplificar operações e administração do ambiente.

---

# Componentes da Arquitetura

## Usuário

Representa administradores, desenvolvedores e aplicações clientes que acessam o ambiente para consultas, validações e testes.

### Responsabilidades

* Executar consultas SQL.
* Validar migração dos dados.
* Realizar testes funcionais.

---

## Ambiente de Aplicação

Camada responsável pela execução das aplicações e ferramentas de suporte utilizadas na PoC.

### Componentes

* Docker
* SQL Server Container
* Ferramentas de migração
* Clientes SQL

---

## Banco de Dados Origem

Microsoft SQL Server executando a base AdventureWorksLT2019.

### Responsabilidades

* Hospedar dados de origem.
* Permitir avaliação de compatibilidade.
* Servir como fonte da migração.

---

## Camada de Migração

Responsável pela transferência dos dados e objetos do ambiente SQL Server para Aurora PostgreSQL.

### Componentes

* Babelfish Compass
# 01 - High Level Architecture

## Objetivo

Este documento apresenta a Arquitetura de Alto Nível (High Level Architecture - HLA) da Prova de Conceito (PoC) de migração de banco de dados Microsoft SQL Server para Amazon Aurora PostgreSQL utilizando Babelfish.

A arquitetura foi projetada para demonstrar uma estratégia de modernização de ambientes legados, preservando a compatibilidade com aplicações existentes e reduzindo o impacto da migração.

---

# Visão Geral da Solução

A solução proposta utiliza serviços da AWS para disponibilizar uma plataforma escalável, segura e resiliente, permitindo a migração gradual de workloads SQL Server para Aurora PostgreSQL com suporte ao protocolo TDS e linguagem T-SQL através do Babelfish.

Principais objetivos da arquitetura:

* Reduzir dependência de licenciamento SQL Server.
* Demonstrar viabilidade técnica do Babelfish.
* Facilitar futuras iniciativas de modernização.
* Garantir alta disponibilidade e escalabilidade.
* Simplificar operações e administração do ambiente.

---

# Componentes da Arquitetura

## Usuário

Representa administradores, desenvolvedores e aplicações clientes que acessam o ambiente para consultas, validações e testes.

### Responsabilidades

* Executar consultas SQL.
* Validar migração dos dados.
* Realizar testes funcionais.

---

## Ambiente de Aplicação

Camada responsável pela execução das aplicações e ferramentas de suporte utilizadas na PoC.

### Componentes

* Docker
* SQL Server Container
* Ferramentas de migração
* Clientes SQL

---

## Banco de Dados Origem

Microsoft SQL Server executando a base AdventureWorksLT2019.

### Responsabilidades

* Hospedar dados de origem.
* Permitir avaliação de compatibilidade.
* Servir como fonte da migração.

---

## Camada de Migração

Responsável pela transferência dos dados e objetos do ambiente SQL Server para Aurora PostgreSQL.

### Componentes

* Babelfish Compass
* Scripts de análise
* Ferramentas de conversão
* AWS Database Migration Service (cenário futuro)

---

## Banco de Dados Destino

Amazon Aurora PostgreSQL com Babelfish habilitado.

### Responsabilidades

* Receber dados migrados.
* Executar comandos T-SQL compatíveis.
* Validar a interoperabilidade com aplicações legadas.

---

## Observabilidade

Camada responsável pelo monitoramento operacional da solução.

### Componentes

* Logs
* Métricas
* Health Checks
* Monitoramento do PostgreSQL

---

## Segurança

Camada transversal aplicada a todos os componentes.

### Controles

* IAM
* Controle de acesso
* Gestão de segredos
* Criptografia
* Monitoramento de segurança

---

# Fluxo da Solução

```text
Usuário
    │
    ▼
Ferramentas Cliente
    │
    ▼
SQL Server (Origem)
    │
    ▼
Babelfish Compass
    │
    ▼
Análise de Compatibilidade
    │
    ▼
Aurora PostgreSQL + Babelfish
    │
    ▼
Validação e Testes
```

---

# Benefícios da Arquitetura

## Escalabilidade

Utilização de serviços gerenciados capazes de crescer conforme a demanda.

## Redução de Custos

Diminuição da dependência de licenciamento proprietário.

## Modernização

Adoção de arquitetura baseada em serviços gerenciados na nuvem.

## Segurança

Aplicação de controles alinhados às boas práticas de governança.

## Continuidade Operacional

Possibilidade de migração gradual com menor impacto para aplicações existentes.

---

# Considerações Finais

A Arquitetura de Alto Nível demonstra como a utilização do Babelfish pode apoiar processos de modernização de bancos de dados SQL Server para AWS, reduzindo riscos de migração e preservando investimentos realizados nas aplicações existentes.

Este documento serve como referência para os documentos de arquitetura detalhada, segurança, operação e estratégia de migração apresentados nas próximas seções do projeto.
