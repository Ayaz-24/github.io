# Data Notes

This project uses the public Fitbit Fitness Tracker dataset commonly supplied with the Bellabeat case study.

Expected inputs:

```text
dailyActivity_merged.csv
sleepDay_merged.csv
```

Run the preparation workflow from the project directory:

```bash
python bellabeat_data_cleaning.py \
  data/dailyActivity_merged.csv \
  data/sleepDay_merged.csv \
  data/bellabeat_activity_sleep_clean.csv
```

The script standardizes dates, validates required fields, removes duplicate user-date activity rows, aggregates sleep logs by user and date, and creates a left-joined analytical file.

Raw and generated CSV files are intentionally not included. Retaining only preparation instructions keeps the repository lightweight and respects the original dataset distribution.
