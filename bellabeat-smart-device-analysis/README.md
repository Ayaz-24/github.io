# Bellabeat Smart Device Usage Analysis

## Project Overview

Bellabeat is a wellness technology company focused on health-oriented smart products. This case study analyzes Fitbit activity and sleep data to identify behavioural patterns that could support stronger customer engagement and more relevant wellness marketing.

The analysis combines daily activity and sleep information using Excel, Google BigQuery, SQL, Python and Tableau.

## Business Objective

The analysis was designed to:

- Understand users' daily activity and sleep behaviour.
- Measure steps, distance, calories and activity intensity.
- Assess the availability and limitations of the recorded data.
- Explore the relationship between activity and sleep.
- Translate the findings into customer-engagement and marketing recommendations.

## Dataset

The project uses public Fitbit Fitness Tracker data containing daily activity and sleep records from a small group of consenting users.

Key analytical fields include:

- User ID and activity date
- Total steps and total distance
- Very active, fairly active, lightly active and sedentary minutes
- Calories
- Total minutes asleep and time in bed

The activity analysis contains **457 daily records across 35 users**. Sleep data is available for **23 of those 35 activity users**, which is an important limitation when interpreting combined activity-and-sleep results.

See [`data/README.md`](data/README.md) for data preparation notes.

## Tools Used

- **Excel** — initial review, formatting checks and basic validation
- **Google BigQuery / SQL** — quality checks, descriptive statistics, aggregation and joins
- **Python (pandas)** — repeatable cleaning, validation and merged dataset creation
- **Tableau** — interactive visual analysis and insight communication

## Data Cleaning and Validation

The workflow included:

1. Standardizing column names and date formats.
2. Checking record counts and distinct user counts.
3. Removing duplicate user-date records.
4. Checking key metrics for missing or impossible values.
5. Comparing activity-user coverage with sleep-user coverage.
6. Aggregating multiple sleep logs to one user-date record.
7. Left-joining sleep summaries to daily activity to preserve the full activity population.

The repeatable preparation workflow is provided in [`bellabeat_data_cleaning.py`](bellabeat_data_cleaning.py), and the analytical queries are in [`bellabeat_analysis.sql`](bellabeat_analysis.sql).

## Key KPIs

| KPI | Result |
|---|---:|
| Daily activity records | 457 |
| Activity users | 35 |
| Users with sleep records | 23 |
| Average daily steps | 6,547 |
| Median daily steps | 5,986 |
| Average daily distance | 4.66 |

## Key Findings

### Daily Activity

Users averaged approximately **6,547 steps per day**, with a median of **5,986 steps**. The mean being higher than the median indicates that higher-activity days pulled the average upward.

### Distance

Average recorded daily distance was approximately **4.66** in the source dataset's distance unit. The result supports the step-based finding that the observed users were active, but not consistently at high daily activity levels.

### Sleep Coverage

Sleep information was available for only **23 of 35 activity users**. Combined activity-and-sleep insights therefore describe the sleep-recording subset and should not be generalized to every user without caution.

## Business Recommendations

1. **Offer personalized daily goals** based on each user's recent baseline rather than applying one target to everyone.
2. **Use progress summaries and achievable milestones** to encourage consistent engagement without overemphasizing exceptional high-activity days.
3. **Encourage combined activity and sleep tracking** to create a broader wellness experience and improve the completeness of user insights.
4. **Create context-aware messages** around inactivity, bedtime consistency and progress streaks while allowing users to control notification frequency.
5. **Measure feature adoption and retention** before assuming that increased app interaction produces sustained wellness behaviour.

## Tableau Dashboard

The dashboard presents:

- Average and median daily steps
- Daily activity and distance patterns
- Activity-intensity distribution
- Sedentary-time patterns
- Sleep coverage and sleep-duration analysis
- User-level comparisons and filters

[View the interactive Tableau dashboard](https://public.tableau.com/app/profile/mohd.ayaz.mahmood/viz/Bellabeat_17869023015560/Dashboard1)

## Limitations

- The sample is small and may not represent Bellabeat's customer base.
- The observation period is limited.
- Sleep data is missing for part of the activity-user population.
- Device non-wear and inconsistent logging can affect recorded behaviour.
- Observational relationships should not be interpreted as proof of causation.

## Skills Demonstrated

**SQL:** validation, descriptive statistics, date-based aggregation, joins and conditional analysis

**Python:** pandas, date parsing, duplicate handling, aggregation and merge validation

**Tableau:** KPI design, filters, behavioural comparisons and dashboard storytelling

**Analytics:** data-quality assessment, user segmentation, limitation awareness and recommendation development

## Repository Structure

```text
bellabeat-smart-device-analysis/
├── README.md
├── bellabeat_analysis.sql
├── bellabeat_data_cleaning.py
└── data/
    └── README.md
```

## Conclusion

The data suggests an opportunity to improve engagement through personalized, achievable activity goals and a more integrated activity-and-sleep experience. Because the dataset is small and sleep coverage is incomplete, the recommendations should be tested through controlled product experiments and monitored with clear adoption and retention KPIs.
