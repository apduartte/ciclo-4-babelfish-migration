# Assessment Summary Evidence

## Objective

This document summarizes the SQL Server source assessment evidence collected during the Babelfish migration POC.

## Source Environment

| Item | Value |
|---|---|
| Source database engine | Microsoft SQL Server |
| Source container | sqlserver-adventureworks |
| Source database | AdventureWorksLT2019 |
| Target database engine | PostgreSQL with Babelfish |
| Target container | postgres-babelfish |
| Assessment phase | Source inventory and compatibility assessment |

## Environment Status

| Component | Status |
|---|---|
| SQL Server source container | Running |
| PostgreSQL/Babelfish target container | Running |
| Legacy SQL Server container | Stopped |
| AdventureWorksLT2019 database | ONLINE |

## SQL Server Object Inventory

The source database inventory identified 15 objects.

| Object Category | Quantity |
|---|---:|
| Schemas identified | 2 |
| Base tables | 12 |
| Views | 3 |
| Total objects | 15 |

## Schemas Identified

| Schema | Description |
|---|---|
| dbo | Default SQL Server schema containing technical/support tables |
| SalesLT | AdventureWorksLT business schema containing sales-related tables and views |

## Evidence Files

| Evidence File | Description |
|---|---|
| container-restart-and-source-validation.md | Documents the source container restart and database ONLINE validation |
| sqlserver-table-inventory.txt | Contains the SQL Server table and view inventory |
| report-assessment-report-bbf.5.5.0-2026-May-18-22.58.44.html | Babelfish assessment report generated for compatibility analysis |

## Assessment Result

The SQL Server source environment was successfully validated.

The AdventureWorksLT2019 database is online, accessible, and contains a mapped inventory of tables and views required for the migration assessment phase.

## Technical Value

This evidence demonstrates:

- Source database availability validation
- Correct SQL Server container selection
- Pre-migration object inventory
- Compatibility assessment preparation
- Evidence-based migration governance
- Traceability for future migration, remediation, and validation phases

## Conclusion

The source database is ready for the next phase of the POC: schema compatibility analysis, remediation planning, and migration execution toward PostgreSQL with Babelfish.
