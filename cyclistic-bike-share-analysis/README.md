# Cyclistic Bike-Share Analysis

## Project Overview

Cyclistic is a fictional Chicago bike-share company. This case study compares how annual members and casual riders used the service in Q1 2019 and Q1 2020, then translates those differences into practical membership-growth recommendations.

The final analysis covers **more than 791,000 valid rides** and is presented through an executive-focused Tableau dashboard.

## Business Objective

The analysis was designed to:

- Compare ride volume and ride duration for annual members and casual riders.
- Identify monthly and weekday usage patterns.
- Measure how rider behaviour changed between Q1 2019 and Q1 2020.
- Identify opportunities to convert suitable casual riders into annual members.
- Communicate the results through an interactive Tableau dashboard.

## Dataset

The project uses Cyclistic/Divvy trip data for:

- Q1 2019
- Q1 2020

The source files use different column names, so the two periods were standardized before they were combined. The analysis uses fields such as ride ID, start and end timestamps, station details, rider type and calculated ride duration.

Raw source data is not stored in this repository. See [`data/README.md`](data/README.md) for expected files and preparation notes.

## Tools Used

- **Python (pandas)** — schema standardization, cleaning, feature engineering and validation
- **SQL** — aggregation, rider-type comparison, monthly trends and weekday analysis
- **Tableau** — interactive dashboard development and executive storytelling
- **Business analytics** — KPI design, trend interpretation and recommendation development

## Data Preparation

The preparation workflow included:

1. Standardizing the different Q1 2019 and Q1 2020 schemas.
2. Converting timestamps to a consistent datetime format.
3. Normalizing rider labels to `casual` and `member`.
4. Removing duplicate ride records.
5. Removing records with missing or invalid timestamps.
6. Calculating ride duration in minutes.
7. Excluding rides with non-positive durations.
8. Creating year, month and weekday fields for trend analysis.

The reproducible preparation workflow is documented in [`cyclistic_data_cleaning.py`](cyclistic_data_cleaning.py).

## Key KPIs

| KPI | Result |
|---|---:|
| Valid rides analyzed | 791K+ |
| Casual rides, Q1 2019 | 23,095 |
| Casual rides, Q1 2020 | 48,136 |
| Casual ride growth | 108.4% |
| Average casual ride duration | 36.42 minutes |
| Average member ride duration | 11.41 minutes |

## Key Findings

### Ride Duration

Casual riders averaged **36.42 minutes per ride**, more than three times the **11.41-minute** member average. This suggests that casual riders were more likely to use the service for longer, leisure-oriented trips, while members tended to make shorter, repeat journeys.

### Casual-Rider Growth

Casual rides increased from **23,095 in Q1 2019 to 48,136 in Q1 2020**, representing growth of approximately **108.4%**.

### Rider Trends

Casual usage increased across the comparison period, while member usage showed a declining monthly pattern. The different trends indicate that a single marketing message is unlikely to work equally well for both rider groups.

## Business Recommendations

1. **Target frequent casual riders** with conversion campaigns based on repeat usage rather than targeting every casual rider.
2. **Position membership around convenience and value**, especially for riders whose repeated pay-per-ride costs may exceed membership cost.
3. **Time campaigns around periods of rising casual demand** so offers reach riders when engagement is already increasing.
4. **Use rider-specific messaging**: emphasize savings and convenience for frequent riders while retaining flexible ride options for occasional leisure users.
5. **Track conversion KPIs** such as offer response, membership conversion, repeat usage and retention after conversion.

## Tableau Dashboard

The dashboard communicates:

- Total rides by rider type
- Average ride duration by rider type
- Q1 2019 versus Q1 2020 trends
- Monthly ride volume
- Weekday usage patterns
- Differences between casual and member behaviour

[View the interactive Tableau dashboard](https://public.tableau.com/app/profile/mohd.ayaz.mahmood/viz/CyclisticBike-ShareAnalysisQ12019Q12020/CyclisticRiderBehaviourAnalysisQ12019vsQ12020)

## Skills Demonstrated

**Python:** pandas, schema mapping, datetime handling, duplicate removal, validation and feature engineering

**SQL:** conditional aggregation, date functions, grouping, percentage change and rider segmentation

**Tableau:** calculated fields, KPI design, filters, comparisons and dashboard storytelling

**Analytics:** data cleaning, behavioural segmentation, trend analysis and recommendation development

## Repository Structure

```text
cyclistic-bike-share-analysis/
├── README.md
├── cyclistic_analysis.sql
├── cyclistic_data_cleaning.py
└── data/
    └── README.md
```

## Conclusion

Casual riders took substantially longer rides and casual usage more than doubled between the two Q1 periods. The strongest opportunity is to identify frequent casual riders, communicate the financial and convenience benefits of membership, and measure whether targeted campaigns produce sustainable member growth.
