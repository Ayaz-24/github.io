"""Clean and standardize Cyclistic Q1 2019 and Q1 2020 trip data."""

from pathlib import Path
import argparse
import pandas as pd


SCHEMA_2019 = {
    "trip_id": "ride_id",
    "start_time": "started_at",
    "end_time": "ended_at",
    "from_station_name": "start_station_name",
    "to_station_name": "end_station_name",
    "usertype": "member_casual",
}

SCHEMA_2020 = {
    "ride_id": "ride_id",
    "started_at": "started_at",
    "ended_at": "ended_at",
    "start_station_name": "start_station_name",
    "end_station_name": "end_station_name",
    "member_casual": "member_casual",
}

OUTPUT_COLUMNS = [
    "ride_id",
    "started_at",
    "ended_at",
    "start_station_name",
    "end_station_name",
    "member_casual",
]


def standardize(frame: pd.DataFrame, mapping: dict[str, str]) -> pd.DataFrame:
    """Rename source fields and return the common analytical schema."""
    renamed = frame.rename(columns=mapping)
    missing = set(OUTPUT_COLUMNS) - set(renamed.columns)
    if missing:
        raise ValueError(f"Missing required columns: {sorted(missing)}")
    return renamed[OUTPUT_COLUMNS].copy()


def clean_rides(q1_2019: Path, q1_2020: Path) -> pd.DataFrame:
    rides_2019 = standardize(pd.read_csv(q1_2019), SCHEMA_2019)
    rides_2020 = standardize(pd.read_csv(q1_2020), SCHEMA_2020)
    rides = pd.concat([rides_2019, rides_2020], ignore_index=True)

    rides["ride_id"] = rides["ride_id"].astype("string").str.strip()
    rides["started_at"] = pd.to_datetime(rides["started_at"], errors="coerce")
    rides["ended_at"] = pd.to_datetime(rides["ended_at"], errors="coerce")
    rides["member_casual"] = (
        rides["member_casual"]
        .astype("string")
        .str.strip()
        .str.lower()
        .replace({"subscriber": "member", "customer": "casual"})
    )

    rides = rides.dropna(subset=["ride_id", "started_at", "ended_at", "member_casual"])
    rides = rides.drop_duplicates(subset="ride_id")
    rides = rides[rides["member_casual"].isin(["member", "casual"])]

    rides["ride_length_minutes"] = (
        rides["ended_at"] - rides["started_at"]
    ).dt.total_seconds() / 60
    rides = rides[rides["ride_length_minutes"] > 0].copy()

    rides["ride_year"] = rides["started_at"].dt.year
    rides["ride_month"] = rides["started_at"].dt.to_period("M").astype(str)
    rides["weekday"] = rides["started_at"].dt.day_name()
    return rides.sort_values("started_at").reset_index(drop=True)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("q1_2019", type=Path)
    parser.add_argument("q1_2020", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    cleaned = clean_rides(args.q1_2019, args.q1_2020)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    cleaned.to_csv(args.output, index=False)
    print(f"Saved {len(cleaned):,} cleaned rides to {args.output}")


if __name__ == "__main__":
    main()
