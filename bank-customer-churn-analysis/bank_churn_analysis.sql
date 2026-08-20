-- Bank Customer Churn & Retention Analysis
-- Platform: Google BigQuery
-- Table: direct-builder-501908-u9.bank_churn.customers

-- 1. Row count and unique customer IDs
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT CustomerId) AS unique_customers
FROM `direct-builder-501908-u9.bank_churn.customers`;

-- 2. NULL checks for analytically relevant columns
SELECT
  COUNTIF(CreditScore IS NULL) AS creditscore_nulls,
  COUNTIF(Geography IS NULL) AS geography_nulls,
  COUNTIF(Gender IS NULL) AS gender_nulls,
  COUNTIF(Age IS NULL) AS age_nulls,
  COUNTIF(Tenure IS NULL) AS tenure_nulls,
  COUNTIF(Balance IS NULL) AS balance_nulls,
  COUNTIF(NumOfProducts IS NULL) AS products_nulls,
  COUNTIF(HasCrCard IS NULL) AS creditcard_nulls,
  COUNTIF(IsActiveMember IS NULL) AS active_status_nulls,
  COUNTIF(EstimatedSalary IS NULL) AS salary_nulls,
  COUNTIF(Exited IS NULL) AS exited_nulls
FROM `direct-builder-501908-u9.bank_churn.customers`;

-- 3. Numeric range validation
SELECT
  MIN(CreditScore) AS min_credit,
  MAX(CreditScore) AS max_credit,
  MIN(Age) AS min_age,
  MAX(Age) AS max_age,
  MIN(Balance) AS min_balance,
  MAX(Balance) AS max_balance,
  MIN(Tenure) AS min_tenure,
  MAX(Tenure) AS max_tenure,
  MIN(NumOfProducts) AS min_products,
  MAX(NumOfProducts) AS max_products,
  MIN(EstimatedSalary) AS min_salary,
  MAX(EstimatedSalary) AS max_salary
FROM `direct-builder-501908-u9.bank_churn.customers`;

-- 4. Overall churn KPIs
SELECT
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`;

-- 5. Churn by geography
SELECT
  Geography,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY Geography;

-- 6. Churn by gender
SELECT
  Gender,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY Gender;

-- 7. Churn by active member status
SELECT
  IsActiveMember,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY IsActiveMember;

-- 8. Churn by credit card ownership
SELECT
  HasCrCard,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY HasCrCard;

-- 9. Churn by number of products
SELECT
  NumOfProducts,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- 10. Churn by age group
SELECT
  CASE
    WHEN Age <= 30 THEN '18-30'
    WHEN Age <= 40 THEN '31-40'
    WHEN Age <= 50 THEN '41-50'
    WHEN Age <= 60 THEN '51-60'
    ELSE '61+'
  END AS age_group,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY age_group;

-- 11. Churn by tenure
SELECT
  Tenure,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY Tenure
ORDER BY Tenure;

-- 12. Churn by balance group
SELECT
  CASE
    WHEN Balance = 0 THEN '0'
    WHEN Balance <= 50000 THEN '1-50K'
    WHEN Balance <= 100000 THEN '>50K-100K'
    WHEN Balance <= 150000 THEN '>100K-150K'
    ELSE '150K+'
  END AS balance_group,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY balance_group;

-- 13. Churn by credit score group
SELECT
  CASE
    WHEN CreditScore < 500 THEN '350-499'
    WHEN CreditScore <= 599 THEN '500-599'
    WHEN CreditScore <= 699 THEN '600-699'
    WHEN CreditScore <= 799 THEN '700-799'
    ELSE '800-850'
  END AS credit_score_group,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY credit_score_group;

-- 14. Churn by estimated salary group
SELECT
  CASE
    WHEN EstimatedSalary <= 50000 THEN '0-50K'
    WHEN EstimatedSalary <= 100000 THEN '>50K-100K'
    WHEN EstimatedSalary <= 150000 THEN '>100K-150K'
    ELSE '>150K-200K'
  END AS salary_group,
  COUNT(*) AS total_customers,
  COUNTIF(Exited = 1) AS churned_customers,
  COUNTIF(Exited = 0) AS retained_customers,
  ROUND(COUNTIF(Exited = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY salary_group;

-- 15. Average customer profile: retained vs churned
SELECT
  Exited,
  ROUND(AVG(Age), 2) AS avg_age,
  ROUND(AVG(CreditScore), 2) AS avg_credit_score,
  ROUND(AVG(Balance), 2) AS avg_balance,
  ROUND(AVG(Tenure), 2) AS avg_tenure,
  ROUND(AVG(NumOfProducts), 2) AS avg_products,
  ROUND(AVG(EstimatedSalary), 2) AS avg_salary
FROM `direct-builder-501908-u9.bank_churn.customers`
GROUP BY Exited;
