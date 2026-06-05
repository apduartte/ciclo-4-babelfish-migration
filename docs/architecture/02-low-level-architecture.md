02 - Low Level Architecture

Objetivo

Este documento apresenta a Arquitetura de Baixo Nível (Low Level Architecture - LLA) da Prova de Conceito (PoC) de migração do Microsoft SQL Server para Amazon Aurora PostgreSQL com Babelfish.

O objetivo é detalhar os componentes técnicos, fluxos de comunicação, configurações e dependências utilizadas durante a implementação da solução.

Visão Técnica da Solução

A PoC foi implementada em um ambiente local baseado em Windows 11, utilizando WSL2 e Docker para execução do Microsoft SQL Server em contêineres Linux.

O ambiente foi projetado para simular um cenário de migração corporativa para AWS, permitindo avaliar compatibilidade, conectividade e comportamento do Babelfish.

Componentes Técnicos
Estação de Trabalho
Sistema Operacional
Windows 11
WSL2 (Windows Subsystem for Linux)
Responsabilidades
Hospedar o ambiente de laboratório
Executar Docker Engine
Executar ferramentas administrativas
Camada de Virtualização
WSL2

Responsável por fornecer um ambiente Linux integrado ao Windows.

Benefícios
Baixo consumo de recursos
Compatibilidade com Docker
Ambiente semelhante ao utilizado em servidores Linux
Plataforma de Contêineres
Docker Engine

Responsável pela execução dos contêineres utilizados na PoC.

Componentes
Docker CLI
Docker Network
Docker Volumes
Responsabilidades
Isolamento dos serviços
Persistência dos dados
Gerenciamento dos contêineres
Banco de Dados de Origem
Microsoft SQL Server 2022

Executado em contêiner Docker.

Porta
1433/TCP
Base Utilizada
AdventureWorksLT2019
Função
Ambiente de origem da migração
Validação de compatibilidade T-SQL
Execução dos testes funcionais
Ferramenta de Assessment
Babelfish Compass

Utilizada para análise de compatibilidade entre SQL Server e Aurora PostgreSQL.

Funções
Avaliação de objetos SQL
Identificação de incompatibilidades
Geração de relatórios técnicos
Banco de Dados de Destino
Aurora PostgreSQL

Ambiente alvo da migração.

Extensão
Babelfish for PostgreSQL
Portas

PostgreSQL:

5432/TCP

Babelfish (TDS):

1433/TCP
Responsabilidades
Receber os dados migrados
Interpretar comandos T-SQL suportados
Armazenar dados da aplicação
Fluxo Técnico da Solução
Cliente SQL
     │
     ▼
SQL Server Container
     │
     ▼
Babelfish Compass
     │
     ▼
Assessment Report
     │
     ▼
Aurora PostgreSQL
     │
     ▼
Babelfish Endpoint
     │
     ▼
Validação
Fluxo de Rede
Comunicação Local
Origem	Destino	Porta	Protocolo
Cliente SQL	SQL Server	1433	TCP
Cliente SQL	Babelfish	1433	TCP
Cliente PostgreSQL	Aurora PostgreSQL	5432	TCP
Armazenamento
Docker Volumes

Responsáveis pela persistência dos dados do SQL Server.

Benefícios
Preservação dos bancos de dados
Recuperação após reinicialização
Isolamento do ambiente
Dependências
Software
Docker Desktop
Docker Engine
WSL2
SQL Server 2022
Babelfish Compass
PostgreSQL Client Tools
Git
GitHub
Requisitos de Infraestrutura
Hardware
Recomendado
Recurso	Quantidade
CPU	4 vCPUs
Memória	8 GB
Disco	50 GB
Controles Operacionais
Backup
Exportação de bancos
Persistência em volumes Docker
Monitoramento
Docker Logs
PostgreSQL Logs
SQL Server Logs
Health Checks
Status dos contêineres
Disponibilidade das portas
Validação das conexões
Riscos Técnicos Identificados
Compatibilidade T-SQL

Nem todos os recursos do SQL Server possuem suporte no Babelfish.

Mitigação

Utilização do Babelfish Compass para identificação antecipada de incompatibilidades.

Dependência de Ambiente Local

A PoC depende de recursos da estação de trabalho.

Mitigação

Documentação completa da configuração e automação da infraestrutura.

Considerações Finais

A Arquitetura de Baixo Nível detalha a implementação técnica da PoC, evidenciando a interação entre Docker, SQL Server, Babelfish Compass e Aurora PostgreSQL.

Este documento complementa a Arquitetura de Alto Nível e fornece a base para o detalhamento da topologia de rede, segurança, operação e estratégia de migração apresentados nos documentos subsequentes.
