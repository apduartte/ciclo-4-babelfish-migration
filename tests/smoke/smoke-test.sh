#!/bin/bash

set -euo pipefail

echo "========================================="
echo "SQL Server Smoke Test Initialization"
echo "========================================="

SQLCMD="/opt/mssql-tools18/bin/sqlcmd"

if [ ! -f "$SQLCMD" ]; then
  echo "ERROR: sqlcmd binary not found at:"
  echo "$SQLCMD"
  exit 1
fi

echo "Validating SQL Server connectivity..."

$SQLCMD \
  -S localhost \
  -U sa \
  -P 'YourStrongPassw0rd' \
  -Q "SELECT GETDATE() AS current_timestamp;" \
  -C

echo "========================================="
echo "Smoke test executed successfully."
echo "SQL Server connection validated."
echo "========================================="

