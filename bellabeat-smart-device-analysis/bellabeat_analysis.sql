-- Bellabeat Smart Device Usage Analysis
-- SQL dialect: Google BigQuery
-- Replace table references with your own project and dataset names.

-- 1. Activity record and user counts
SELECT
  COUNT(*) AS activity_records,
  COUNT(DISTINCT Id) AS activity_users,
  COUNT(DISTINCT STRUCT(Id, ActivityDate)) AS unique_user_dates
FROM `project.dataset.daily_activity`;

-- 2. Duplicate activity records by user and date
SELECT
  Id,
  ActivityDate,
  COUNT(*) AS record_count
FROM `project.dataset.daily_activity`
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1
ORDER BY record_count DESC;

-- 3. Missing and invalid activity values
SELECT
  COUNTIF(TotalSteps IS NULL) AS missing_steps,
  COUNTIF(TotalDistance IS NULL) AS missing_distance,
  COUNTIF(Calories IS NULL) AS missing_calories,
  COUNTIF(TotalSteps < 0) AS negative_steps,
  COUNTIF(TotalDistance < 0) AS negative_distance,
  COUNTIF(Calories < 0) AS negative_calories
FROM `project.dataset.daily_activity`;

-- 4. Overall activity KPIs
SELECT
  ROUND(AVG(TotalSteps), 0) AS average_daily_steps,
  APPROX_QUANTILES(TotalSteps, 2)[OFFSET(1)] AS median_daily_steps,
  ROUND(AVG(TotalDistance), 2) AS average_daily_distance,
  ROUND(AVG(Calories), 0) AS average_daily_calories,
  ROUND(AVG(SedentaryMinutes), 0) AS average_sedentary_minutes
FROM `project.dataset.daily_activity`;

-- 5. Average activity-intensity minutes
SELECT
  ROUND(AVG(VeryActiveMinutes), 2) AS avg_very_active_minutes,
  ROUND(AVG(FairlyActiveMinutes), 2) AS avg_fairly_active_minutes,
  ROUND(AVG(LightlyActiveMinutes), 2) AS avg_lightly_active_minutes,
  ROUND(AVG(SedentaryMinutes), 2) AS avg_sedentary_minutes
FROM `project.dataset.daily_activity`;

-- 6. Activity patterns by weekday
SELECT
  FORMAT_DATE('%A', ActivityDate) AS weekday,
  ROUND(AVG(TotalSteps), 0) AS average_steps,
  ROUND(AVG(TotalDistance), 2) AS average_distance,
  ROUND(AVG(Calories), 0) AS average_calories
FROM `project.dataset.daily_activity`
GROUP BY weekday, EXTRACT(DAYOFWEEK FROM ActivityDate)
ORDER BY MOD(EXTRACT(DAYOFWEEK FROM ActivityDate) + 5, 7);

-- 7. Sleep record and user coverage
SELECT
  COUNT(*) AS sleep_records,
  COUNT(DISTINCT Id) AS sleep_users,
  COUNT(DISTINCT STRUCT(Id, SleepDay)) AS unique_user_dates
FROM `project.dataset.daily_sleep`;

-- 8. Create one sleep summary per user and date before joining
WITH sleep_by_day AS (
  SELECT
    Id,
    SleepDay,
    SUM(TotalMinutesAsleep) AS total_minutes_asleep,
    SUM(TotalTimeInBed) AS total_time_in_bed
  FROM `project.dataset.daily_sleep`
  GROUP BY Id, SleepDay
)
SELECT
  a.Id,
  a.ActivityDate,
  a.TotalSteps,
  a.TotalDistance,
  a.SedentaryMinutes,
  a.Calories,
  s.total_minutes_asleep,
  s.total_time_in_bed
FROM `project.dataset.daily_activity` AS a
LEFT JOIN sleep_by_day AS s
  ON a.Id = s.Id
 AND a.ActivityDate = s.SleepDay;

-- 9. Activity comparison for records with and without sleep data
WITH combined AS (
  SELECT
    a.*,
    s.TotalMinutesAsleep
  FROM `project.dataset.daily_activity` AS a
  LEFT JOIN `project.dataset.daily_sleep` AS s
    ON a.Id = s.Id
   AND a.ActivityDate = s.SleepDay
)
SELECT
  IF(TotalMinutesAsleep IS NULL, 'No sleep record', 'Sleep recorded') AS sleep_status,
  COUNT(*) AS daily_records,
  ROUND(AVG(TotalSteps), 0) AS average_steps,
  ROUND(AVG(SedentaryMinutes), 0) AS average_sedentary_minutes,
  ROUND(AVG(Calories), 0) AS average_calories
FROM combined
GROUP BY sleep_status;
