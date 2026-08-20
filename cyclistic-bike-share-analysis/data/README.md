# Data Notes

Download the public Cyclistic/Divvy trip files for Q1 2019 and Q1 2020 from the case-study data source, then keep the raw CSV files outside version control.

Expected inputs for the cleaning script:

```text
q1_2019.csv
q1_2020.csv
```

Run the preparation workflow from the project directory:

```bash
python cyclistic_data_cleaning.py data/q1_2019.csv data/q1_2020.csv data/cyclistic_clean.csv
```

The script standardizes the two source schemas, validates required fields, removes duplicates and invalid timestamps, calculates ride length, and adds calendar fields for analysis.

Raw and generated CSV files are intentionally not included in the repository because they are large and remain available from the original provider.
