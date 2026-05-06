# 🚀 Enterprise Migration: SQL Server → PostgreSQL (Babelfish + AWS DMS)

## 📌 Overview

This project demonstrates an enterprise-grade architecture for migrating legacy SQL Server workloads to PostgreSQL using Babelfish and AWS Database Migration Service (DMS).

The solution enables **incremental migration with near-zero downtime**, allowing organizations to modernize their database layer without rewriting existing applications.

---

## 🎯 Problem Statement

Legacy SQL Server systems introduce:

- High licensing costs
- Strong vendor lock-in
- Risky full rewrite migrations
- Limited cloud-native scalability

---

## 🧠 Solution Overview

This implementation introduces:

- **Babelfish for PostgreSQL** → Enables T-SQL compatibility
- **AWS DMS** → Continuous Data Capture (CDC) for live migration
- **Amazon RDS (PostgreSQL)** → Managed database target
- **Amazon S3** → Intermediate storage (optional)
- **Docker** → Local simulation environment

---

## 🏗️ Architecture

SQL Server (Source)
│
▼
AWS DMS (CDC)
│
▼
Amazon RDS (PostgreSQL + Babelfish)
│
▼
Application Layer (unchanged)


---

## 🔄 Migration Strategy

1. Full load migration using AWS DMS
2. Enable CDC (Change Data Capture)
3. Redirect application to Babelfish endpoint
4. Gradual decommission of SQL Server

---

## ⚙️ How to Run (Local Simulation)

```bash
# Start containers
docker-compose up -d --build

# Access application
http://localhost:8080

📂 Project Structure
.
├── docs/
├── scripts/
├── docker-compose.yml
└── README.md

🎯 Key Benefits
Zero/low downtime migration
No need to rewrite application layer
Cost reduction (SQL Server → PostgreSQL)
Cloud-native readiness

🧠 Technical Decisions

| Decision  | Reason                     |
| --------- | -------------------------- |
| Babelfish | Avoid rewriting T-SQL      |
| AWS DMS   | Reliable CDC pipeline      |
| Docker    | Reproducible local testing |

🚀 Future Improvements
CI/CD with GitHub Actions
Terraform for infra provisioning
Observability with CloudWatch


---
