#!/bin/bash

echo "========================================="
echo " PostgreSQL Smoke Test"
echo "========================================="

CONTAINER="postgres-babelfish"
DATABASE="migrationlab"
USER="postgres"

echo ""
echo "[1] VALIDANDO SELECT..."
docker exec -i $CONTAINER psql -U $USER -d $DATABASE -c "
SELECT * FROM migration.clientes;
"

echo ""
echo "[2] VALIDANDO INSERT..."
docker exec -i $CONTAINER psql -U $USER -d $DATABASE -c "
INSERT INTO migration.clientes (nome)
VALUES ('Cliente Smoke Test');
"

echo ""
echo "[3] VALIDANDO UPDATE..."
docker exec -i $CONTAINER psql -U $USER -d $DATABASE -c "
UPDATE migration.clientes
SET nome = 'Cliente Atualizado'
WHERE nome = 'Cliente Smoke Test';
"

echo ""
echo "[4] VALIDANDO DELETE..."
docker exec -i $CONTAINER psql -U $USER -d $DATABASE -c "
DELETE FROM migration.clientes
WHERE nome = 'Cliente Atualizado';
"

echo ""
echo "[5] VALIDANDO RESULTADO FINAL..."
docker exec -i $CONTAINER psql -U $USER -d $DATABASE -c "
SELECT * FROM migration.clientes;
"

echo ""
echo "========================================="
echo " Smoke Test Finalizado com Sucesso"
echo "========================================="
