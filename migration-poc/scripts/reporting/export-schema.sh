#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"

echo "================================="
echo "SQL SERVER SCHEMA EXPORT"
echo "================================="

mkdir -p "$BASE_DIR/migration-poc/reports/assessment"

echo ""
echo "[1] Validando container SQL Server..."

if ! docker ps | grep -q sqlserver; then
    echo "ERRO: container sqlserver nao esta em execucao."
    exit 1
fi

echo ""
echo "[2] Exportando tabelas do AdventureWorks2019..."

docker exec sqlserver \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'YourStrongPassw0rd' \
-C \
-d AdventureWorks2019 \
-Q "SELECT name FROM sys.tables;" \
-o /tmp/sqlserver-tables.txt

if [ $? -ne 0 ]; then
    echo "ERRO: falha ao exportar tabelas."
    exit 1
fi

echo ""
echo "[3] Copiando relatorio..."

docker cp sqlserver:/tmp/sqlserver-tables.txt \
"$BASE_DIR/migration-poc/reports/assessment/sqlserver-tables.txt"

if [ $? -ne 0 ]; then
    echo "ERRO: falha ao copiar relatorio."
    exit 1
fi

echo ""
echo "================================="
echo "SCHEMA EXPORTADO COM SUCESSO"
echo "================================="
