# Sales Performance & Profitability Dashboard

## Project Overview

This Power BI project provides an interactive view of sales performance and profitability across products, categories, regions and time. It brings sales and product data into a reusable analytical model and turns the core business metrics into a compact management dashboard.

## Business Objective

The dashboard was designed to:

- Monitor total sales, total profit and profit margin.
- Compare sales performance across product categories and regions.
- Identify changes in monthly sales performance.
- Enable users to filter results by date, region and product.
- Provide a reliable model that responds consistently to filter context.

## Dataset and Model

The model combines two core tables:

- **Sales** — transactional values including date, product, region, sales and profit
- **Product** — descriptive product and category attributes

A dedicated **Date** table supports chronological filtering and time-based analysis. The model follows a simple star-schema approach:

```text
Date (1) ──────── (*) Sales (*) ──────── (1) Product
```

## Tools Used

- **Power BI Desktop** — data model, report development and interaction design
- **Power Query** — type correction, field cleanup and table preparation
- **DAX** — reusable KPI and profitability measures
- **Data modeling** — table relationships, filter direction and Date-table design

## Data Preparation

The Power Query workflow included:

1. Loading the Sales and Product tables.
2. Promoting headers and assigning correct data types.
3. Trimming and cleaning text fields.
4. Checking key fields for blanks and duplicate Product IDs.
5. Confirming that Sales product keys match the Product table.
6. Loading clean tables into the semantic model.

Detailed transformation guidance is available in [`power-query-steps.md`](power-query-steps.md).

## Data Model

- `Product[Product ID]` has a one-to-many relationship with `Sales[Product ID]`.
- `Date[Date]` has a one-to-many relationship with `Sales[Date]`.
- Filters flow from the Date and Product dimensions into Sales.
- KPI logic is implemented as measures so results respond to slicers and visual context.

## Key Measures

The reusable DAX definitions are documented in [`measures.dax`](measures.dax).

| KPI | Result |
|---|---:|
| Total Sales | 855 |
| Total Profit | 435 |
| Profit Margin | 50.88% |

## Dashboard Features

- KPI cards for Total Sales, Total Profit and Profit Margin
- Monthly Sales Trend for time-based monitoring
- Sales comparison by product category
- Region and category performance matrix
- Date, Region and Product slicers
- Dynamic calculations that respond to filter selections

## Analytical Use Cases

### Performance Monitoring

The KPI cards provide an immediate summary of current results under the selected filter context.

### Trend Analysis

The monthly trend helps users distinguish sustained performance changes from one-off movements and supports period-based review.

### Product and Regional Comparison

Category and region views help managers identify where sales and profitability are concentrated and where further investigation may be required.

## Business Recommendations

1. **Review sales and profit together** so high-revenue categories are not assumed to be the most valuable without checking margin.
2. **Investigate underperforming region-category combinations** for pricing, product-mix, availability or execution issues.
3. **Use monthly trends for planning** and compare material movements with commercial events, promotions and operational changes.
4. **Define KPI ownership and refresh frequency** so dashboard insights are tied to a regular decision-making process.
5. **Expand the model carefully** with targets, units, customers and costs when reliable source data becomes available.

## Limitations and Next Steps

- The current portfolio version contains a compact demonstration dataset.
- Results should be interpreted within the available date, product and regional coverage.
- Future versions could include target-versus-actual performance, year-over-year growth, customer segmentation and drill-through detail.
- Refresh documentation and automated data-quality checks would be required for production use.

## Skills Demonstrated

**Power Query:** data loading, type management, text cleanup and quality checks

**DAX:** aggregation, safe division, filter-context awareness and time-based measures

**Power BI:** KPI cards, trends, matrix views, slicers and interaction design

**Data modeling:** dimension design, relationships and reusable semantic measures

## Repository Structure

```text
sales-performance-profitability-dashboard/
├── README.md
├── measures.dax
└── power-query-steps.md

Sales-Insights-and-Performance-Dashboard.pbix
```

## Power BI File

[Download the Power BI project](../Sales-Insights-and-Performance-Dashboard.pbix) and open it using Microsoft Power BI Desktop.

## Conclusion

The dashboard creates a clear, filterable view of sales and profitability from a compact data model. Its strongest value is the combination of reusable DAX measures, structured relationships and focused visuals that allow business users to move from headline performance to product, regional and monthly detail.
