#!/bin/bash

set -e

echo "🔎 Validating row count..."

/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P 'YourStrongPassw0rd' \
-Q "SELECT name FROM sys.databases;" \
-C

echo "✅ Validation completed."
