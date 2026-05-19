-- =====================================================
-- Inicialização PostgreSQL
-- POC SQL Server → PostgreSQL/Babelfish
-- =====================================================

CREATE SCHEMA migration;

CREATE TABLE migration.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    criado_em TIMESTAMP DEFAULT NOW()
);

INSERT INTO migration.clientes(nome)
VALUES ('Ana Paula');

