# Data Analysis Projects

Three smaller analysis projects: two exploratory notebooks and a SQL project. For deeper work, see [NYC Airbnb: cleaning, EDA & modeling](https://github.com/Talhax55z/airbnb-nyc-eda-modeling) and [Telco churn prediction](https://github.com/Talhax55z/telco-churn-prediction).

| Project | Data | Tools | Focus |
|---|---|---|---|
| [`zomato-analysis/`](zomato-analysis) | Zomato restaurant listings | pandas, seaborn, matplotlib | 6 business questions, each answered with a chart and a written conclusion |
| [`eid-sales-eda/`](eid-sales-eda) | Eid-season retail orders, 11,251 rows | pandas, seaborn, matplotlib | Revenue and order patterns by gender, age, city, marital status, occupation and product |
| [`ola-sql/`](ola-sql) | Ola ride bookings | MySQL | 10 reusable views for cancellations, ratings, payments and revenue |

Datasets are not included in this repo.

## Zomato: six questions

1. Which restaurant type do most customers order from? (count plot)
2. How many votes does each restaurant type receive? (grouped sum, line plot)
3. Which rating range do most restaurants fall in? (histogram)
4. What do couples typically spend per order? (count plot of cost for two)
5. Do online or offline orders get higher ratings? (box plot)
6. Which restaurant types get the most offline orders? (pivot table + heatmap)

The `rate` column arrives as text like `"4.1/5"`, so it is parsed to a float before analysis.

## Eid sales: what the data shows

- **11,251 → 11,239 rows** after dropping 12 rows with a missing `Amount`; two unused columns (`Status`, `unnamed1`) dropped.
- **Women account for about 70% of total spend** (74.3M vs 31.9M) and are the majority of buyers.
- The **26–35** age group buys the most, followed by 36–45.
- **Islamabad, Karachi, Faisalabad and Rawalpindi** are the top four cities by revenue.
- **Halal food** is the largest product category, roughly a third of total revenue.

## Ola SQL: ten views

Every question is saved as a `CREATE OR REPLACE VIEW` and queried straight after, so the file can be re-run safely.

| # | View | Answers |
|---|---|---|
| 1 | `Successful_Bookings` | All successful bookings |
| 2 | `average_ride_distance_for_each_vehicle` | Average distance per vehicle type |
| 3 | `canceled_rides_by_customers` | Rides canceled by customers |
| 4 | `Top_5_customers` | Five customers with the most rides |
| 5 | `canceled_by_drivers_P_C_issues` | Driver cancellations for personal or car issues |
| 6 | `maximum_and_minimum_driver_ratings` | Rating range for Prime Sedan |
| 7 | `UPI_Payment` | Rides paid by UPI |
| 8 | `average_rating_p_Vehicle` | Average customer rating per vehicle type |
| 9 | `total_successful_ride_value` | Total value of successful rides |
| 10 | `incomplete_rides_along_with_the_reason` | Incomplete rides and why |

SQL used: `CREATE VIEW`, `WHERE`, `GROUP BY`, `ORDER BY ... LIMIT`, and the `COUNT`, `AVG`, `MAX`, `MIN`, `SUM` aggregates. See [`ola_queries.sql`](ola-sql/ola_queries.sql) for the expected `bookings` columns.
