# 📂 Evidências Técnicas

Esta seção centraliza todas as evidências geradas durante a execução da Proof of Concept (POC) de modernização de banco de dados Microsoft SQL Server para PostgreSQL utilizando Babelfish.

O objetivo é garantir rastreabilidade, auditoria, reprodutibilidade e validação dos resultados obtidos em cada etapa da migração.

---

# Objetivos

* Registrar a evolução da POC
* Comprovar as validações realizadas
* Documentar resultados e evidências técnicas
* Facilitar auditorias e revisões
* Apoiar processos de troubleshooting e rollback
* Garantir rastreabilidade ponta a ponta

---

# Estrutura das Evidências

## 01. Environment

Evidências relacionadas à preparação e configuração do ambiente.

### Exemplos

* Provisionamento inicial
* Containers Docker
* Configuração PostgreSQL
* Configuração SQL Server
* Configuração Babelfish

---

## 02. SQL Server

Validações executadas no ambiente Microsoft SQL Server.

### Exemplos

* Restore AdventureWorksLT2019
* Testes de conectividade
* Validação de objetos
* Execução de consultas T-SQL

---

## 03. Babelfish Compass

Resultados do assessment de compatibilidade utilizando Babelfish Compass.

### Exemplos

* Relatórios de compatibilidade
* Objetos suportados
* Objetos não suportados
* Recomendações de remediação

---

## 04. Assessment

Avaliações técnicas realizadas antes da migração.

### Exemplos

* Inventário de objetos
* Análise de dependências
* Avaliação de riscos
* Identificação de incompatibilidades

---

## 05. Remediation

Evidências relacionadas às correções realizadas para compatibilidade.

### Exemplos

* Ajustes de scripts
* Conversões de objetos
* Correções de procedimentos
* Adequações T-SQL

---

## 06. Migration

Registros da execução da migração.

### Exemplos

* Execução AWS DMS
* Exportação e importação de dados
* Logs de migração
* Métricas de execução

---

## 07. Validation

Validações pós-migração.

### Exemplos

* Testes funcionais
* Comparação de resultados
* Reconciliação de dados
* Testes de conectividade

---

## 08. Rollback

Procedimentos e evidências relacionados à reversão controlada.

### Exemplos

* Plano de rollback
* Testes de restauração
* Recuperação de backups
* Evidências de recuperação

---

# Tipos de Evidência

Esta estrutura pode conter:

* Capturas de tela (Screenshots)
* Logs operacionais
* Relatórios técnicos
* Outputs Terraform
* Relatórios SARIF
* Evidências GitHub Actions
* Evidências AWS DMS
* Evidências pg_dump
* Evidências de validação SQL Server
* Evidências de validação PostgreSQL

---

# Resultado Esperado

Ao final da POC, esta estrutura fornecerá um histórico completo da jornada de modernização, permitindo rastrear decisões, validar resultados e demonstrar a execução controlada do processo de migração.
