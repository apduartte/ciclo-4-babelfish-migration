#!/bin/bash

echo "================================="
echo "ROW COUNT VALIDATION"
echo "================================="

echo ""
echo "[1] SQL Server - Person.Person"

docker exec sqlserver \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'YourStrongPassw0rd' \
-C \
-d AdventureWorks2019 \
-Q "SELECT COUNT(*) AS Total FROM Person.Person;"

echo ""
echo "[2] PostgreSQL - Inventory"

docker exec bia-db \
psql -U postgres \
-c "SELECT COUNT(*) FROM information_schema.tables;"

