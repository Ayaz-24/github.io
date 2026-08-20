# Cyclistic Bike-Share Analysis

## Project Overview

Cyclistic is a fictional Chicago bike-share company. This case study analyzes how **casual riders and annual members** used the bike-share service across Q1 2019 and Q1 2020.

The project analyzes **791,357 valid rides** to identify differences in ride volume, ride duration, and rider behaviour. The findings are presented through an executive-focused Tableau dashboard and translated into recommendations for increasing annual membership.

---

## Business Objective

The analysis was designed to answer the following business questions:

- How does ride volume differ between casual riders and members?
- How much did casual ridership change from Q1 2019 to Q1 2020?
- How does average ride duration differ between rider types?
- How did casual and member ride volumes change during Q1 2020?
- What opportunities exist to convert suitable casual riders into annual members?

---

## Dataset

The project uses Cyclistic/Divvy bike-share trip data from:

- **Q1 2019**
- **Q1 2020**

Because the two datasets used different schemas and rider-type labels, the data was standardized before analysis.

For consistency:

- `Customer` was standardized to `casual`
- `Subscriber` was standardized to `member`

Raw source data is not stored in this repository.

See [data/README.md](data/README.md) for dataset and preparation information.

---

## Tools Used

- **SQL / BigQuery** — data cleaning, validation, aggregation, and rider analysis
- **Python (pandas)** — additional data preparation and validation
- **Tableau** — KPI development, data visualization, and dashboard storytelling
- **GitHub** — project documentation and portfolio presentation

---

## Data Preparation

The preparation process included:

1. Reviewing the Q1 2019 and Q1 2020 datasets.
2. Standardizing column names and data types.
3. Standardizing rider categories to `casual` and `member`.
4. Validating ride start and end timestamps.
5. Removing invalid rides where the end time occurred before the start time.
6. Excluding rides longer than 24 hours.
7. Calculating ride duration.
8. Creating year and month fields for trend analysis.
9. Combining the cleaned Q1 2019 and Q1 2020 datasets.
10. Validating the final dataset before visualization.

The final cleaned dataset contained:

**791,357 valid rides**

The reproducible preparation workflow is available in:

[cyclistic_data_cleaning.py](cyclistic_data_cleaning.py)

SQL analysis is available in:

[cyclistic_analysis.sql](cyclistic_analysis.sql)

---

## Key KPIs

| KPI | Result |
| --- | ---: |
| Valid Rides Analyzed | **791,357** |
| Casual Rides — Q1 2019 | **23,095** |
| Casual Rides — Q1 2020 | **48,136** |
| Casual Ride Growth YoY | **108.4%** |
| Average Casual Ride Duration | **36.42 min** |
| Average Member Ride Duration | **11.41 min** |

---

## Key Findings

### 1. Casual Ridership More Than Doubled

Casual rides increased from **23,095 in Q1 2019 to 48,136 in Q1 2020**, representing approximately **108.4% year-over-year growth**.

This indicates substantial growth in casual rider engagement between the two periods.

### 2. Casual Riders Take Significantly Longer Trips

Casual riders averaged **36.42 minutes per ride**, compared with **11.41 minutes for members**.

Casual trips were therefore more than **3× longer** on average than member trips, highlighting a clear behavioural difference between the two rider groups.

### 3. Q1 2020 Monthly Trends Differed by Rider Type

During Q1 2020, casual monthly rides increased significantly:

- January: **7,721**
- February: **12,806**
- March: **27,609**

During the same period, member monthly rides declined:

- January: **136,082**
- February: **126,696**
- March: **115,566**

This distinction is important: **member rides increased overall from Q1 2019 to Q1 2020, but showed a declining month-to-month trend within Q1 2020.**

---

## Business Recommendations

1. **Target frequent casual riders for membership conversion**  
   Focus marketing efforts on casual riders who demonstrate repeat usage rather than targeting every casual user.

2. **Position membership around convenience and value**  
   Show frequent casual riders how annual membership could provide better value and convenience compared with repeated individual ride purchases.

3. **Time campaigns around increasing casual demand**  
   Casual usage increased substantially during Q1 2020, suggesting that conversion campaigns could be more effective during periods of growing casual activity.

4. **Use rider-specific marketing messages**  
   Casual and member riders demonstrate different usage behaviours, so marketing communication should be tailored rather than using a single message for both groups.

5. **Track conversion performance**  
   Monitor KPIs such as campaign response rate, membership conversion rate, repeat usage, and retention to determine whether conversion initiatives are successful.

---

## Tableau Dashboard

The redesigned Tableau dashboard provides an executive view of:

- **791K** valid rides analyzed
- **108.4%** casual ride growth YoY
- Average ride duration by rider type
- Q1 2019 vs Q1 2020 ride volume
- Q1 2020 monthly ride trends
- Key analytical insights and business implications

### Dashboard Preview

![Cyclistic Bike-Share Analysis Dashboard](Cyclistic%20Rider%20Behaviour%20Analysis%20Q1%202019%20vs%20Q1%202020.png)

### Interactive Dashboard

[View the Interactive Tableau Dashboard](https://public.tableau.com/app/profile/mohd.ayaz.mahmood/viz/CyclisticBike-ShareAnalysisQ12019Q12020/CyclisticRiderBehaviourAnalysisQ12019vsQ12020)

---

## Skills Demonstrated

### SQL / BigQuery
- Data cleaning
- Conditional aggregation
- Date functions
- `GROUP BY`
- Rider segmentation
- Trend analysis
- Data validation

### Python
- pandas
- Schema standardization
- Datetime handling
- Data cleaning
- Feature engineering
- Validation

### Tableau
- Calculated fields
- KPI cards
- Filters
- Comparative analysis
- Trend visualization
- Dashboard design
- Executive storytelling

### Business Analytics
- KPI development
- Behavioural segmentation
- Trend interpretation
- Insight generation
- Business recommendations

---

## Repository Structure

```text
cyclistic-bike-share-analysis/
├── README.md
├── Cyclistic Rider Behaviour Analysis Q1 2019 vs Q1 2020.png
├── cyclistic_analysis.sql
├── cyclistic_data_cleaning.py
└── data/
    └── README.md
```

---

## Conclusion

The analysis identified meaningful behavioural differences between Cyclistic's casual riders and annual members.

Casual ridership grew **108.4% year over year**, while casual riders also took trips more than **three times longer** than members on average. Within Q1 2020, casual monthly usage increased sharply while member monthly usage declined.

These findings suggest an opportunity to identify **high-frequency casual riders** and target them with membership campaigns focused on convenience, value, and repeated usage.

The project demonstrates an end-to-end analytics workflow from **data preparation and SQL analysis to Tableau visualization, business insight generation, and portfolio presentation**.
