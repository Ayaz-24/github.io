# Power Query Preparation Guide

## Sales Table

1. Promote the first row to headers.
2. Set `Date` to the Date type.
3. Set `Product ID` and other identifiers to Text unless the source requires numeric keys.
4. Set `Sales` and `Profit` to Decimal Number or Fixed Decimal Number based on the reporting requirement.
5. Trim and clean Region and other text fields.
6. Filter blank product keys and invalid dates.
7. Check for duplicate transaction rows using the available business key.

## Product Table

1. Promote the first row to headers.
2. Set `Product ID` to the same type used in Sales.
3. Trim and clean product and category fields.
4. Remove blank Product IDs.
5. Confirm Product ID is unique before using the table on the one-side of the relationship.

## Model Validation

- Compare the row count before and after transformations.
- Confirm every Sales product key has a matching Product record.
- Confirm the Date table covers the full minimum-to-maximum Sales date range.
- Format KPI measures consistently.
- Test each slicer individually and in combination.
- Reconcile unfiltered totals with the source data before publishing.

## Recommended Refresh Checks

- Source files are available and use the expected names.
- Column names and data types have not changed.
- No new blank or duplicate keys were introduced.
- Sales and profit values remain within reasonable business ranges.
- The latest transaction date matches the expected reporting period.
