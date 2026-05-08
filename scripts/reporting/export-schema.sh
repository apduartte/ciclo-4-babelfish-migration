#!/bin/bash

set -e

echo "📦 Exporting schema metadata..."

mkdir -p reports/assessment

/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P 'YourStrongPassw0rd' \
-Q "SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;" \
-C \
-o reports/assessment/sqlserver-tables.txt

echo "✅ Schema export completed."
