O que deve conter
1. Objetivo

Explicar o desenho de rede da solução.

2. Visão Geral da Topologia

Exemplo:

Internet
    │
    ▼
Load Balancer
    │
    ▼
Application Layer
    │
    ▼
Aurora PostgreSQL + Babelfish
3. Componentes de Rede
VPC
Função
Benefícios
Subnets Públicas
Load Balancer
Bastion Host (se aplicável)
Subnets Privadas
Aurora PostgreSQL
Serviços internos
4. Security Groups

Exemplo:

Origem	Destino	Porta
Aplicação	Babelfish	1433
Aplicação	PostgreSQL	5432
Administrador	SSH	22
5. Fluxo de Comunicação
Usuário
   │
   ▼
Aplicação
   │
   ▼
Babelfish
   │
   ▼
Aurora PostgreSQL
6. Regras de Segurança
Menor privilégio
Criptografia
Controle de acesso
Isolamento de rede
7. Considerações para Produção
Multi-AZ
Backup
Monitoramento
Alta disponibilidade
Depois do Network Design

A sequência recomendada é:

1. 03-network-design.md
            ↓
2. current-state-analysis.md
            ↓
3. feasibility-study.md
            ↓
4. cost-analysis.md
            ↓
5. migration-plan.md
            ↓
6. validation-plan.md
