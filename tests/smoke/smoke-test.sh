#!/bin/bash

set -e

echo "🔎 Running SQL Server smoke test..."

/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P 'YourStrongPassw0rd' \
-Q "SELECT GETDATE();" \
-C

echo "✅ Smoke test completed successfully."
