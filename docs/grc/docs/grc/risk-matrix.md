# Risk Matrix

| ID | Risk | Impact | Probability | Mitigation | Status |
|----|------|---------|-------------|-------------|--------|
| R01 | SQL Server incompatibility with Babelfish | High | Medium | Compatibility validation tests | Open |
| R02 | Secrets exposure in repository | High | Low | Trivy secret scanning | Mitigated |
| R03 | Vulnerable dependencies | Medium | Medium | Automated Trivy scan | Mitigated |
| R04 | CI/CD pipeline failure | Medium | Low | GitHub Actions validation | Mitigated |
| R05 | Migration performance degradation | Medium | Medium | Benchmark testing | Open |
```
