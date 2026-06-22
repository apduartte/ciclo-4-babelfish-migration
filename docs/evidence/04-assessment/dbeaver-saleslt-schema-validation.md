# DBeaver SalesLT Schema Validation Evidence

## Objective

This evidence documents the visual validation of the `SalesLT` schema in the `AdventureWorksLT2019` SQL Server source database using DBeaver.

## Validation Context

The DBeaver connection was used to inspect the SQL Server source database and confirm the presence of the `SalesLT` schema and its business tables.

## Source Database

| Item | Value |
|---|---|
| Database | AdventureWorksLT2019 |
| Schema | SalesLT |
| Tool | DBeaver |
| Validation type | Visual schema and table inventory validation |

## Tables Identified in SalesLT Schema

| Table Name |
|---|
| Address |
| Customer |
| CustomerAddress |
| Product |
| ProductCategory |
| ProductDescription |
| ProductModel |
| ProductModelProductDescription |
| SalesOrderDetail |
| SalesOrderHeader |

## Evidence File

| File | Description |
|---|---|
| dbeaver-saleslt-schema-tables.png | DBeaver screenshot showing the SalesLT schema and its 10 tables |

## Result

The `SalesLT` schema was successfully validated through DBeaver.

The visual evidence confirms that the SQL Server source database contains the expected business tables required for the migration assessment phase.

## Technical Value

This evidence complements the command-line SQL Server inventory by providing a visual validation layer through a database client.

It strengthens the assessment documentation by demonstrating:

- Source database accessibility through DBeaver
- Schema-level visibility
- Table-level inventory confirmation
- Cross-validation between CLI output and graphical database inspection
- Evidence-based migration governance

## Conclusion

The `SalesLT` schema and its 10 tables were visually validated in DBeaver and are ready to support the next phases of compatibility analysis, remediation planning, and migration execution.
