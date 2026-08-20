# Dataset Information

This project uses a bank customer churn dataset containing **10,000 customer records** and 14 fields covering demographics, account characteristics, and churn status.

## Fields

- `RowNumber` — row index in the source dataset
- `CustomerId` — unique customer identifier
- `Surname` — customer surname
- `CreditScore` — customer credit score
- `Geography` — customer country/region
- `Gender` — customer gender
- `Age` — customer age
- `Tenure` — number of years with the bank
- `Balance` — account balance
- `NumOfProducts` — number of bank products used
- `HasCrCard` — credit card ownership indicator (1 = Yes, 0 = No)
- `IsActiveMember` — active customer indicator (1 = Active, 0 = Inactive)
- `EstimatedSalary` — estimated annual salary
- `Exited` — churn indicator (1 = Churned, 0 = Retained)

## Data Quality Summary

- Total rows: **10,000**
- Unique Customer IDs: **10,000**
- Duplicate Customer IDs: **0**
- Missing values in analyzed fields: **0**

## Notes

The raw dataset is not duplicated in this repository by default. The analysis was performed in Google BigQuery, and the SQL used for validation and churn analysis is available in `../bank_churn_analysis.sql`.
