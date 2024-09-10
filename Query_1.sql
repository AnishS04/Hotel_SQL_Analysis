-- Question 1: What time of the year sees the highest booking rates?
-- Create Tables to order data

/*
-- Bookings per month
CREATE TABLE bookings_by_month AS
SELECT arrival_date_year,
       arrival_date_month,
       COUNT(*) AS booking_count
FROM hotel_booking
WHERE is_canceled = 0
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;


-- Average number of bookings per month
CREATE TABLE avg_bookings_per_month AS
SELECT arrival_date_month,
       AVG(monthly_booking_count) AS avg_monthly_bookings
FROM (
    SELECT arrival_date_month,
           COUNT(*) AS monthly_booking_count
    FROM hotel_booking
    WHERE is_canceled = 0
    GROUP BY arrival_date_year, arrival_date_month
) AS monthly_bookings
GROUP BY arrival_date_month
ORDER BY avg_monthly_bookings DESC;


-- Average number of bookings by season 
CREATE TABLE avg_bookings_by_season AS
WITH SeasonTotals AS (
    SELECT season,
           SUM(booking_count) AS total_booking_count,
           COUNT(DISTINCT arrival_date_year) AS num_years
    FROM (
        SELECT arrival_date_year,
               CASE
                   WHEN arrival_date_month IN ('December', 'January', 'February') THEN 'Winter'
                   WHEN arrival_date_month IN ('March', 'April', 'May') THEN 'Spring'
                   WHEN arrival_date_month IN ('June', 'July', 'August') THEN 'Summer'
                   WHEN arrival_date_month IN ('September', 'October', 'November') THEN 'Fall'
                   ELSE 'Unknown' -- Handle cases where month is invalid or null
               END AS season,
               COUNT(*) AS booking_count
        FROM hotel_booking
        WHERE is_canceled = 0 AND arrival_date_month IS NOT NULL
        GROUP BY arrival_date_year, season
    ) AS season_bookings
    GROUP BY season
)
-- Calculate average bookings per season
SELECT season,
       total_booking_count / num_years AS avg_booking_count
FROM SeasonTotals
ORDER BY avg_booking_count DESC;
*/

SELECT * FROM avg_bookings_by_season;
SELECT * FROM avg_bookings_per_month;
SELECT * FROM bookings_by_month;




