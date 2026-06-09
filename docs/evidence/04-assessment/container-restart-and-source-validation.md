# Container Restart and Source Database Validation Evidence

## Objective

This evidence documents the restart of the correct SQL Server source container and the validation of the AdventureWorksLT2019 source database before the migration assessment phase.

## Context

During the environment validation, two SQL Server containers were identified:

- `sqlserver`
- `sqlserver-adventureworks`

To avoid port conflict on port `1433` and ensure the correct source database was used, the legacy `sqlserver` container was stopped and the `sqlserver-adventureworks` container was started.

## Commands Executed

### Stop legacy SQL Server container

```bash
docker stop sqlserver
```

Expected output:

```text
sqlserver
```

### Start correct SQL Server source container

```bash
docker start sqlserver-adventureworks
```

Expected output:

```text
sqlserver-adventureworks
```

### Validate running containers

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

Expected result:

```text
NAMES                      STATUS          PORTS
sqlserver-adventureworks   Up              0.0.0.0:1433->1433/tcp
postgres-babelfish         Up              0.0.0.0:5432->5432/tcp
```

### Validate source database status

```sql
SELECT name, state_desc
FROM sys.databases
WHERE name = 'AdventureWorksLT2019';
GO
```

Expected result:

```text
name                 state_desc
-------------------  ----------
AdventureWorksLT2019 ONLINE
```

## Evidence Generated

The following evidence was captured:

```text
docs/evidence/03-compass/adventureworkslt2019-database-online.png
```

## Result

The correct SQL Server source container was restarted successfully.

The `AdventureWorksLT2019` source database was validated as `ONLINE`, confirming that the environment is ready for the migration assessment phase.

## Technical Value

This evidence demonstrates:

- Correct source container selection
- Port conflict mitigation on `1433`
- SQL Server source database availability
- Pre-assessment operational validation
- Evidence-based migration governance

## Conclusion

The source SQL Server environment is operational and ready for the next phase: schema inventory and compatibility assessment for migration to PostgreSQL / Babelfish.
