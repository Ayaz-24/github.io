"""Prepare Bellabeat daily activity and sleep data for analysis."""

from pathlib import Path
import argparse
import pandas as pd


def clean_activity(path: Path) -> pd.DataFrame:
    activity = pd.read_csv(path)
    required = {"Id", "ActivityDate", "TotalSteps", "TotalDistance", "Calories"}
    missing = required - set(activity.columns)
    if missing:
        raise ValueError(f"Activity data is missing columns: {sorted(missing)}")

    activity["ActivityDate"] = pd.to_datetime(
        activity["ActivityDate"], errors="coerce"
    ).dt.date
    activity = activity.dropna(subset=["Id", "ActivityDate"])
    activity = activity.drop_duplicates(subset=["Id", "ActivityDate"])

    nonnegative = [
        "TotalSteps",
        "TotalDistance",
        "Calories",
        "VeryActiveMinutes",
        "FairlyActiveMinutes",
        "LightlyActiveMinutes",
        "SedentaryMinutes",
    ]
    for column in [name for name in nonnegative if name in activity.columns]:
        activity = activity[activity[column].fillna(-1) >= 0]
    return activity


def clean_sleep(path: Path) -> pd.DataFrame:
    sleep = pd.read_csv(path)
    required = {"Id", "SleepDay", "TotalMinutesAsleep", "TotalTimeInBed"}
    missing = required - set(sleep.columns)
    if missing:
        raise ValueError(f"Sleep data is missing columns: {sorted(missing)}")

    sleep["SleepDay"] = pd.to_datetime(sleep["SleepDay"], errors="coerce").dt.date
    sleep = sleep.dropna(subset=["Id", "SleepDay"])
    return (
        sleep.groupby(["Id", "SleepDay"], as_index=False)
        .agg(
            TotalMinutesAsleep=("TotalMinutesAsleep", "sum"),
            TotalTimeInBed=("TotalTimeInBed", "sum"),
        )
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("activity_csv", type=Path)
    parser.add_argument("sleep_csv", type=Path)
    parser.add_argument("output_csv", type=Path)
    args = parser.parse_args()

    activity = clean_activity(args.activity_csv)
    sleep = clean_sleep(args.sleep_csv)
    combined = activity.merge(
        sleep,
        how="left",
        left_on=["Id", "ActivityDate"],
        right_on=["Id", "SleepDay"],
        validate="one_to_one",
    ).drop(columns="SleepDay")

    args.output_csv.parent.mkdir(parents=True, exist_ok=True)
    combined.to_csv(args.output_csv, index=False)
    sleep_users = combined.loc[combined["TotalMinutesAsleep"].notna(), "Id"].nunique()
    print(
        f"Saved {len(combined):,} activity records for "
        f"{combined['Id'].nunique():,} users; {sleep_users:,} users have sleep data."
    )


if __name__ == "__main__":
    main()
