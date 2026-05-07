
#!/bin/bash

echo "🔎 Validando objetos do banco SQL Server..."

/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P 'YourStrongPassw0rd' \
-Q "SELECT name FROM sys.tables" \
-C

if [ $? -eq 0 ]; then
  echo "✅ Validação executada com sucesso"
else
  echo "❌ Falha na validação do banco"
  exit 1
fi
