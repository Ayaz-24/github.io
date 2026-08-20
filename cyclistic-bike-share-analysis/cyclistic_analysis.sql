-- Cyclistic Bike-Share Analysis
-- SQL dialect: Google BigQuery
-- Replace `project.dataset.cyclistic_clean` with your cleaned table.

-- 1. Validate record and ride ID counts
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT ride_id) AS unique_rides
FROM `project.dataset.cyclistic_clean`;

-- 2. Check required fields and duration ranges
SELECT
  COUNTIF(ride_id IS NULL) AS missing_ride_ids,
  COUNTIF(started_at IS NULL) AS missing_start_times,
  COUNTIF(ended_at IS NULL) AS missing_end_times,
  COUNTIF(member_casual IS NULL) AS missing_rider_types,
  COUNTIF(ride_length_minutes <= 0) AS invalid_durations,
  ROUND(MIN(ride_length_minutes), 2) AS minimum_duration,
  ROUND(MAX(ride_length_minutes), 2) AS maximum_duration
FROM `project.dataset.cyclistic_clean`;

-- 3. Overall rider-type KPIs
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS average_ride_minutes,
  ROUND(APPROX_QUANTILES(ride_length_minutes, 2)[OFFSET(1)], 2) AS median_ride_minutes
FROM `project.dataset.cyclistic_clean`
GROUP BY member_casual
ORDER BY total_rides DESC;

-- 4. Year-over-year ride comparison
SELECT
  EXTRACT(YEAR FROM started_at) AS ride_year,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS average_ride_minutes
FROM `project.dataset.cyclistic_clean`
GROUP BY ride_year, member_casual
ORDER BY ride_year, member_casual;

-- 5. Monthly rider trend
SELECT
  DATE_TRUNC(DATE(started_at), MONTH) AS ride_month,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS average_ride_minutes
FROM `project.dataset.cyclistic_clean`
GROUP BY ride_month, member_casual
ORDER BY ride_month, member_casual;

-- 6. Usage by weekday (Monday-first ordering)
SELECT
  FORMAT_DATE('%A', DATE(started_at)) AS weekday,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS average_ride_minutes
FROM `project.dataset.cyclistic_clean`
GROUP BY weekday, member_casual, EXTRACT(DAYOFWEEK FROM started_at)
ORDER BY MOD(EXTRACT(DAYOFWEEK FROM started_at) + 5, 7), member_casual;

-- 7. Casual-ride growth from Q1 2019 to Q1 2020
WITH casual_rides AS (
  SELECT
    EXTRACT(YEAR FROM started_at) AS ride_year,
    COUNT(*) AS total_rides
  FROM `project.dataset.cyclistic_clean`
  WHERE member_casual = 'casual'
  GROUP BY ride_year
)
SELECT
  MAX(IF(ride_year = 2019, total_rides, NULL)) AS casual_rides_2019,
  MAX(IF(ride_year = 2020, total_rides, NULL)) AS casual_rides_2020,
  ROUND(
    SAFE_DIVIDE(
      MAX(IF(ride_year = 2020, total_rides, NULL)) - MAX(IF(ride_year = 2019, total_rides, NULL)),
      MAX(IF(ride_year = 2019, total_rides, NULL))
    ) * 100,
    2
  ) AS casual_ride_growth_pct
FROM casual_rides;

-- 8. Most-used start stations by rider type
SELECT
  member_casual,
  start_station_name,
  COUNT(*) AS total_rides
FROM `project.dataset.cyclistic_clean`
WHERE start_station_name IS NOT NULL
GROUP BY member_casual, start_station_name
QUALIFY ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) <= 10
ORDER BY member_casual, total_rides DESC;
