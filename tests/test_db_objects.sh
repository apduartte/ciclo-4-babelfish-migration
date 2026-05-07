#!/bin/bash

echo "🔎 Validando objetos do banco SQL Server..."

RESULT=$(docker exec sqlserver /opt/mssql-tools18/bin/sqlcmd \
-S localhost -U SA -P 'YourStrongPassw0rd' -C -N -Q "
SELECT COUNT(*) 
FROM sys.objects 
WHERE type IN ('P','V','FN');
")

echo "$RESULT"

if echo "$RESULT" | grep -q "[0-9]"; then
  echo "✅ Teste executado com sucesso"
  exit 0
else
  echo "❌ Falha na validação do banco"
  exit 1
fi
