#!/bin/bash

echo "================================="
echo "SMOKE TEST - MIGRATION POC"
echo "================================="

echo ""
echo "[1] Validando containers..."
docker ps

echo ""
echo "[2] Testando SQL Server..."

docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'YourStrongPassw0rd' \
-C \
-Q "SELECT @@VERSION"

echo ""
echo "[3] Testando PostgreSQL/Babelfish..."

docker exec -it babelfish \
psql -U postgres -d postgres \
-c "SELECT version();"

echo ""
echo "================================="
echo "SMOKE TEST FINALIZADO"
echo "================================="

