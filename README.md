# Smartphones SQL Project

A SQL project built to practice and demonstrate SQL querying skills using a smartphones dataset in MySQL. The project covers basic selection, filtering, aggregation, grouping, and sorting queries.

## Database Used
MySQL

## Dataset
The dataset (`smartphones.csv`) was provided by my teacher as part of a coursework exercise. It contains specifications and details for a range of smartphones across multiple brands.

## Project Structure
```
smartphones/
│-- sql-project-smartphones.sql   # All SQL queries (schema use + analysis)
│-- smartphones.csv                # Dataset
│-- README.md
```

## Table: `smartphones`
| Column                     | Description                                  |
|-----------------------------|-----------------------------------------------|
| brand_name                  | Brand of the smartphone (e.g., Samsung, Apple) |
| model                       | Model name                                    |
| price                       | Price of the phone                            |
| rating                      | Rating out of 100                             |
| has_5g                      | Whether the phone supports 5G (TRUE/FALSE)    |
| has_nfc                     | Whether the phone has NFC (TRUE/FALSE)        |
| has_ir_blaster              | Whether the phone has an IR blaster           |
| processor_brand             | Processor brand (e.g., Snapdragon, Exynos)    |
| num_cores                   | Number of processor cores                     |
| processor_speed             | Processor speed (GHz)                         |
| battery_capacity            | Battery capacity (mAh)                        |
| fast_charging_available     | Whether fast charging is supported            |
| fast_charging                | Fast charging wattage                         |
| ram_capacity                | RAM (GB)                                      |
| internal_memory             | Internal storage (GB)                         |
| screen_size                 | Screen size (inches)                          |
| refresh_rate                | Display refresh rate (Hz)                     |
| num_rear_cameras            | Number of rear cameras                        |
| num_front_cameras           | Number of front cameras                       |
| os                          | Operating system                              |
| primary_camera_rear         | Primary rear camera resolution (MP)           |
| primary_camera_front        | Primary front camera resolution (MP)          |
| extended_memory_available   | Whether expandable storage is supported       |
| extended_upto               | Max expandable storage (GB)                   |
| resolution_width            | Screen resolution width                       |
| resolution_height           | Screen resolution height                      |

## How to Run
1. Install MySQL if you haven't already.
2. Create a database and import the dataset:
   ```sql
   CREATE DATABASE project;
   USE project;
   ```
3. Import `smartphones.csv` into a table named `smartphones` using MySQL Workbench's Table Data Import Wizard, or load it via `LOAD DATA INFILE`.
4. Run any query from `sql-project-smartphones.sql` to explore the data.

## What the Queries Cover
The `sql-project-smartphones.sql` file includes queries grouped by SQL concept:

- **Basic SELECT** – viewing all or specific columns, using aliases
- **DISTINCT** – finding unique brands, processors, and operating systems
- **Filtering (WHERE, AND, OR, IN, BETWEEN)** – e.g., phones by brand, price range, rating, processor type
- **Aggregate functions (MIN, MAX, AVG, SUM, COUNT)** – e.g., cheapest/costliest phone, average rating per brand
- **Sorting (ORDER BY, LIMIT, OFFSET)** – e.g., top 5 Samsung phones by screen size, phone with 2nd largest battery
- **Grouping (GROUP BY)** – e.g., average price by brand, average rating by NFC/5G availability
- **Combined analysis** – e.g., top 5 costliest brands by average price, brands supporting both NFC and IR blaster

## Sample Queries
```sql
-- List all Samsung smartphones with RAM capacity greater than 8 GB
SELECT *
FROM smartphones
WHERE brand_name = 'Samsung'
  AND ram_capacity > 8;

-- Which are the top 5 most costly smartphone brands based on average price?
SELECT
    brand_name,
    AVG(price) AS avg_price
FROM smartphones
GROUP BY brand_name
ORDER BY avg_price DESC
LIMIT 5;

-- Find the phone with the 2nd largest battery
SELECT *
FROM smartphones
ORDER BY battery_capacity DESC
LIMIT 1 OFFSET 1;
```

## Author
This project was created as a learning exercise to practice SQL querying — covering filtering, aggregation, grouping, and sorting — on a real-world smartphone specifications dataset.
