use  project;

-- query to display all the columns from the smartphones table.
select * from smartphones;

-- Retrieve only the model, price, and rating columns
SELECT model, price, rating
FROM smartphones;

-- Display the os, model, and battery_capacity of all smartphones
SELECT os, model, battery_capacity
FROM smartphones;

-- Rename columns using an alias: show os as operating system, battery_capacity as mah, and display the model.
SELECT
    model,
    os AS "operating system",
    battery_capacity AS mah
FROM smartphones;

-- Write a query to display the model name and the rating divided by 10 (rounded to 1 decimal place) for each smartphone.
SELECT 
    model,
    ROUND(rating / 10, 1) AS rating_divided
FROM smartphones;

-- Display all unique smartphone brands from the table.
SELECT DISTINCT brand_name
FROM smartphones;

-- Retrieve all distinct brand names and display them with the alias All brands
SELECT DISTINCT brand_name AS "All brands"
FROM smartphones;

-- Display all unique processor brands with the alias All Processors
SELECT DISTINCT processor_brand AS "All Processors"
FROM smartphones;

-- List all distinct operating systems in the table
SELECT DISTINCT os
FROM smartphones;

-- Retrieve all unique combinations of brand_name and processor_brand
SELECT DISTINCT brand_name, processor_brand
FROM smartphones;

-- List all smartphones where the brand is Samsung
SELECT *
FROM smartphones
WHERE brand_name = 'Samsung';

-- Retrieve all smartphones with a price greater than 50,000
SELECT *
FROM smartphones
WHERE price > 50000;

-- List all smartphones priced between 10,000 and 20,000 using AND
SELECT *
FROM smartphones
WHERE price >= 10000
  AND price <= 20000;
  
-- List all smartphones priced between 10,000 and 20,000 using BETWEEN
SELECT *
FROM smartphones
WHERE price BETWEEN 10000 AND 20000;

-- Display all smartphones with a price below 25,000 and a rating above 80
SELECT *
FROM smartphones
WHERE price < 25000
  AND rating > 80;
  
-- Show all smartphones under 25,000 with a rating above 80 and using a Snapdragon processor
SELECT *
FROM smartphones
WHERE price < 25000
  AND rating > 80
  AND processor_brand = 'Snapdragon';
  
-- List all Samsung smartphones with RAM capacity greater than 8 GB
SELECT *
FROM smartphones
WHERE brand_name = 'Samsung'
  AND ram_capacity > 8;
  
-- Write a query to retrieve all distinct brand names for smartphones priced above 100,000.
SELECT DISTINCT brand_name
FROM smartphones
WHERE price > 100000;

-- List all smartphones where the processor is either Snapdragon, Exynos, or Bionic using the OR operator
SELECT *
FROM smartphones
WHERE processor_brand = 'Snapdragon'
   OR processor_brand = 'Exynos'
   OR processor_brand = 'Bionic';
   
-- Write the same query using the IN operator
SELECT *
FROM smartphones
WHERE processor_brand IN ('Snapdragon', 'Exynos', 'Bionic');

-- Display all smartphones where the processor brand is not Snapdragon, Exynos, or Bionic
SELECT *
FROM smartphones
WHERE processor_brand NOT IN ('Snapdragon', 'Exynos', 'Bionic');

-- Find the minimum price among all smartphones
SELECT MIN(price) AS min_price
FROM smartphones;

-- Find the maximum price among all smartphones
SELECT MAX(price) AS max_price
FROM smartphones;

-- Retrieve the maximum RAM capacity available among smartphones
SELECT MAX(ram_capacity) AS max_ram
FROM smartphones;

-- Display the maximum price of Samsung smartphones
SELECT MAX(price) AS max_samsung_price
FROM smartphones
WHERE brand_name = 'Samsung';

-- Calculate the average rating of all Apple smartphones
SELECT AVG(rating) AS avg_apple_rating
FROM smartphones
WHERE brand_name = 'Apple';

-- Calculate the average rating of all OnePlus smartphones
SELECT AVG(rating) AS avg_oneplus_rating
FROM smartphones
WHERE brand_name = 'OnePlus';

-- Find the total sum of all smartphone prices
SELECT SUM(price) AS total_price
FROM smartphones;

-- Count how many smartphones have a rating available for the brand Samsung
SELECT COUNT(rating) AS samsung_rated_phones
FROM smartphones
WHERE brand_name = 'Samsung';

-- Count the number of Samsung smartphones with RAM capacity greater than 8 GB
SELECT COUNT(*) AS samsung_high_ram_phones
FROM smartphones
WHERE brand_name = 'Samsung'
  AND ram_capacity > 8;
  
-- Count the total number of distinct smartphone brands
SELECT COUNT(DISTINCT brand_name) AS total_brands
FROM smartphones;

-- Find the top 5 Samsung phones with the biggest screen size
SELECT *
FROM smartphones
WHERE brand_name = 'Samsung'
ORDER BY screen_size DESC
LIMIT 5;

-- Sort all the phones in descending order of the number of total cameras
SELECT *,
       (num_rear_cameras + num_front_cameras) AS total_cameras
FROM smartphones
ORDER BY total_cameras DESC;

-- Find the phone with the 2nd largest battery
SELECT *
FROM smartphones
ORDER BY battery_capacity DESC
LIMIT 1 OFFSET 1;

-- Find the name and rating of the worst-rated Apple phone
SELECT model, rating
FROM smartphones
WHERE brand_name = 'Apple'
ORDER BY rating ASC
LIMIT 1;

-- Sort phones alphabetically and then on the basis of rating in descending order
SELECT *
FROM smartphones
ORDER BY model ASC, rating DESC;

-- Sort phones alphabetically and then on the basis of price in ascending order
SELECT *
FROM smartphones
ORDER BY model ASC, price ASC;

-- How many smartphone models does each brand have, and what are their average price, max rating, and average battery capacity?
SELECT
    brand_name,
    COUNT(*) AS total_models,
    AVG(price) AS avg_price,
    MAX(rating) AS max_rating,
    AVG(battery_capacity) AS avg_battery
FROM smartphones
GROUP BY brand_name;

-- What is the average price and rating of smartphones grouped by NFC availability?
SELECT
    has_nfc,
    AVG(price) AS avg_price,
    AVG(rating) AS avg_rating
FROM smartphones
GROUP BY has_nfc;

-- What is the average price of 5G smartphones compared to non-5G smartphones?
SELECT
    has_5g,
    AVG(price) AS avg_price
FROM smartphones
GROUP BY has_5g;

-- How does fast charging availability affect smartphone distribution or specs?
SELECT
    fast_charging_available,
    COUNT(*) AS total_models,
    AVG(price) AS avg_price,
    AVG(battery_capacity) AS avg_battery,
    AVG(rating) AS avg_rating
FROM smartphones
GROUP BY fast_charging_available;

-- What is the average price of smartphones grouped by extended memory availability?
SELECT
    extended_memory_available,
    AVG(price) AS avg_price
FROM smartphones
GROUP BY extended_memory_available;

-- Group smartphones by brand and processor brand and get the count of models and the average rear camera resolution
SELECT
    brand_name,
    processor_brand,
    COUNT(*) AS total_models,
    AVG(primary_camera_rear) AS avg_rear_camera
FROM smartphones
GROUP BY brand_name, processor_brand;

-- Which are the top 5 most costly smartphone brands based on average price?
SELECT
    brand_name,
    AVG(price) AS avg_price
FROM smartphones
GROUP BY brand_name
ORDER BY avg_price DESC
LIMIT 5;

-- Which brand makes smartphones with the smallest screen sizes on average?
SELECT
    brand_name,
    AVG(screen_size) AS avg_screen_size
FROM smartphones
GROUP BY brand_name
ORDER BY avg_screen_size ASC
LIMIT 1;

-- Which brand has the highest number of models that support both NFC and IR blaster?
SELECT
    brand_name,
    COUNT(*) AS total_models
FROM smartphones
WHERE has_nfc = 1
  AND has_ir_blaster = 1
GROUP BY brand_name
ORDER BY total_models DESC
LIMIT 1;

-- Among Samsung 5G smartphones, what is the average price of models with and without NFC?
SELECT
    has_nfc,
    AVG(price) AS avg_price
FROM smartphones
WHERE brand_name = 'Samsung'
  AND has_5g = 1
GROUP BY has_nfc;










