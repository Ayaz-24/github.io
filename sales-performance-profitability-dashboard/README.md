# Sales Performance & Profitability Dashboard

## Project Overview

This Power BI project provides an interactive view of sales performance and profitability across products, categories, regions, salespeople and time. The final dashboard combines clean KPI reporting with focused trend and performance visuals for a compact management view.

![Sales Performance & Profitability Dashboard](Sales%20Performance%20and%20Profitability%20Dashboard.png)

## Business Objective

The dashboard was designed to:

- Monitor total sales, total profit, profit margin and total orders.
- Identify changes in monthly sales performance.
- Compare sales across regions and salespeople.
- Compare sales and profit across product categories.
- Enable users to filter results by date, region and product.

## Tools Used

- **Power BI Desktop** — report development and interaction design
- **Power Query** — data preparation and cleanup
- **DAX** — KPI and profitability measures
- **Data Modeling** — relationships and filter context

## Key KPIs

| KPI | Result |
|---|---:|
| Total Sales | 855 |
| Total Profit | 435 |
| Profit Margin | 50.88% |
| Total Orders | 5 |

## Dashboard Features

- KPI cards for Total Sales, Total Profit, Profit Margin and Total Orders
- Monthly Sales Trend
- Sales by Region
- Sales by Salesperson
- Sales & Profit by Product Category
- Date, Region and Product slicers
- Dynamic calculations that respond to filter selections

## Key Findings

- North recorded the highest regional sales at 500.
- Eli was the top salesperson with total sales of 300.
- Gadgets generated 735 in sales and 371 in profit, making them the strongest product category.
- Accessories generated 120 in sales and 64 in profit.
- Monthly sales declined from 370 in January to 185 in February, then recovered to 300 in March.

## Business Recommendations

1. Investigate the drivers behind stronger sales performance in the North region and identify practices that may be transferable to other regions.
2. Review the approach used by top-performing salespeople such as Eli and use relevant practices to support the wider sales team.
3. Continue monitoring Gadgets as the primary sales and profit contributor while identifying opportunities to improve Accessories performance.
4. Investigate the February sales decline and compare it with promotions, seasonality, inventory availability or operational factors.
5. Use the dashboard filters during regular business reviews to examine performance by date, region and product.

## Data Preparation and Modeling

The project uses Sales and Product data prepared in Power Query. Data types, key fields and text values were validated before loading the model. A Date table supports chronological analysis and reusable DAX measures ensure KPI values respond correctly to report filters.

Detailed preparation guidance is available in [`power-query-steps.md`](power-query-steps.md), and the reusable DAX definitions are documented in [`measures.dax`](measures.dax).

## Repository Structure

```text
sales-performance-profitability-dashboard/
├── README.md
├── Sales Performance and Profitability Dashboard.pbix
├── Sales Performance and Profitability Dashboard.png
├── measures.dax
└── power-query-steps.md
```

## Project Files

[View the dashboard screenshot](Sales%20Performance%20and%20Profitability%20Dashboard.png)

[Download the Power BI project](Sales%20Performance%20and%20Profitability%20Dashboard.pbix)

## Skills Demonstrated

**Power Query:** data loading, type management, cleanup and validation

**DAX:** aggregation, distinct order counting, safe division and filter-context awareness

**Power BI:** KPI cards, line charts, bar charts, category comparisons, slicers and dashboard layout

**Business Analytics:** trend analysis, regional performance, salesperson performance and profitability analysis

## Conclusion

The final dashboard provides a clear and interactive view of sales and profitability from a compact dataset. It allows users to move quickly from headline KPIs to monthly trends, regional performance, salesperson performance and category-level profitability.