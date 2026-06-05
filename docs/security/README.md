# 🔐 Segurança e DevSecOps

Esta seção documenta os controles de segurança, práticas DevSecOps, mecanismos de governança e conformidade adotados na Proof of Concept (POC) de modernização de banco de dados Microsoft SQL Server para PostgreSQL utilizando Babelfish.

O objetivo é demonstrar como a solução pode ser implementada seguindo princípios modernos de Cloud Security, automação, rastreabilidade e redução de riscos operacionais.

---

# Visão Geral de Segurança

A estratégia de segurança foi construída com base nos seguintes pilares:

* Controle de acesso e identidade
* Proteção de credenciais
* Criptografia de dados
* Observabilidade e auditoria
* Segurança no ciclo de desenvolvimento
* Governança e conformidade
* Automação de controles DevSecOps

---

# Objetivos de Segurança

* Proteger credenciais e informações sensíveis
* Reduzir a superfície de ataque da infraestrutura
* Garantir rastreabilidade das operações
* Aplicar o princípio do menor privilégio (Least Privilege)
* Automatizar validações de segurança
* Integrar segurança ao ciclo de desenvolvimento
* Fortalecer a governança da solução

---

# Arquitetura de Segurança

Principais serviços considerados na arquitetura alvo:

| Serviço               | Finalidade                             |
| --------------------- | -------------------------------------- |
| IAM                   | Controle de acesso e autorização       |
| OIDC                  | Autenticação segura para pipelines     |
| Secrets Manager       | Gestão de credenciais                  |
| KMS                   | Criptografia e gerenciamento de chaves |
| Systems Manager (SSM) | Administração segura                   |
| CloudWatch            | Monitoramento e observabilidade        |
| CloudTrail            | Auditoria e rastreabilidade            |
| AWS Backup            | Proteção de dados                      |

---

# Controles de Segurança Implementados

## IAM (Identity and Access Management)

Controle de acesso baseado em funções (RBAC) utilizando políticas alinhadas ao princípio do menor privilégio.

### Benefícios

* Redução de permissões excessivas
* Controle granular de acesso
* Melhor governança operacional

---

## OIDC Federation

Integração entre GitHub Actions e AWS sem utilização de credenciais permanentes.

### Benefícios

* Eliminação de Access Keys estáticas
* Credenciais temporárias via AWS STS
* Redução do risco de comprometimento

---

## AWS Systems Manager (SSM)

Administração segura dos ambientes sem exposição de SSH público.

### Benefícios

* Eliminação da porta 22
* Sessões auditáveis
* Menor superfície de ataque

---

## AWS KMS

Gerenciamento centralizado das chaves criptográficas.

### Aplicações

* Criptografia de volumes
* Criptografia de backups
* Proteção de dados sensíveis

---

## AWS Secrets Manager

Armazenamento seguro de credenciais e segredos.

### Benefícios

* Rotação automática de senhas
* Eliminação de segredos em código
* Integração nativa com serviços AWS

---

# Segurança no Pipeline DevSecOps

A segurança é incorporada desde as fases iniciais do ciclo de desenvolvimento.

## Semgrep (SAST)

Análise estática de código para identificação precoce de vulnerabilidades.

### Validações

* Hardcoded Secrets
* Vulnerabilidades conhecidas
* Configurações inseguras
* Más práticas de desenvolvimento

---

## GitHub Security

Recursos nativos de segurança utilizados na plataforma.

### Recursos

* Dependabot
* Secret Scanning
* Code Scanning
* Pull Request Checks
* Security Advisories

---

## SARIF Reports

Exportação dos resultados das análises para integração com o GitHub Security Dashboard.

### Benefícios

* Centralização dos findings
* Rastreabilidade
* Gestão de vulnerabilidades

---

# Hardening da Infraestrutura

A solução adota práticas de endurecimento para reduzir riscos operacionais.

## Controles Aplicados

* Atualização contínua de componentes
* Restrição de acesso administrativo
* Segmentação lógica de ambientes
* Criptografia em trânsito
* Criptografia em repouso
* Gestão centralizada de segredos

---

# Governança e Conformidade

Os controles adotados seguem boas práticas amplamente utilizadas em ambientes corporativos:

* AWS Well-Architected Framework
* Security Pillar
* CIS Benchmarks
* OWASP Top 10
* DevSecOps Best Practices
* Least Privilege Model

---

# Princípio do Menor Privilégio

Todas as permissões devem seguir o conceito de Least Privilege.

## Objetivo

Garantir que usuários, aplicações e pipelines possuam apenas as permissões estritamente necessárias para execução de suas atividades.

---

# Fluxo Simplificado de Segurança

GitHub Actions
↓
OIDC Federation
↓
IAM Role
↓
AWS Services
↓
Secrets Manager
↓
KMS
↓
Banco de Dados

---

# Evidências Relacionadas

As evidências de segurança podem ser consultadas nos diretórios:

docs/evidence/
├── security/
├── semgrep/
├── github-security/
├── oidc/
├── iam/
└── hardening/

---

# Resultado Esperado

A adoção desses controles permite que a solução demonstre uma abordagem alinhada às práticas modernas de Cloud Security e DevSecOps, reduzindo riscos operacionais, fortalecendo a governança e aumentando a confiabilidade do ambiente durante e após a migração.
