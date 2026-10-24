-- Ola ride-sharing analysis (MySQL)
--
-- Expects a `bookings` table with these columns:
--   Booking_ID, Booking_Status, Vehicle_Type, Ride_Distance, Customer_ID,
--   Canceled_Rides_by_Driver, Driver_Ratings, Customer_Rating, Payment_Method,
--   Booking_Value, Incomplete_Rides, Incomplete_Rides_Reason
--
-- Each question is saved as a view, then queried right after it is created.
-- Safe to re-run: CREATE OR REPLACE VIEW overwrites existing views.

CREATE DATABASE IF NOT EXISTS Ola;
USE Ola;

-- 1. All successful bookings
CREATE OR REPLACE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

-- 2. Average ride distance for each vehicle type
CREATE OR REPLACE VIEW average_ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM average_ride_distance_for_each_vehicle;

-- 3. Total number of rides canceled by customers
CREATE OR REPLACE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) AS canceled_by_customer
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customers;

-- 4. Top 5 customers by number of rides booked
CREATE OR REPLACE VIEW Top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM Top_5_customers;

-- 5. Rides canceled by drivers for personal and car-related issues
CREATE OR REPLACE VIEW canceled_by_drivers_P_C_issues AS
SELECT COUNT(*) AS canceled_by_driver_personal_car
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM canceled_by_drivers_P_C_issues;

-- 6. Maximum and minimum driver ratings for Prime Sedan bookings
CREATE OR REPLACE VIEW maximum_and_minimum_driver_ratings AS
SELECT MAX(Driver_Ratings) AS max_ratings,
       MIN(Driver_Ratings) AS min_ratings
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM maximum_and_minimum_driver_ratings;

-- 7. All rides paid with UPI
CREATE OR REPLACE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

-- 8. Average customer rating per vehicle type
CREATE OR REPLACE VIEW average_rating_p_Vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM average_rating_p_Vehicle;

-- 9. Total booking value of successfully completed rides
CREATE OR REPLACE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_value
FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_ride_value;

-- 10. All incomplete rides with the reason
CREATE OR REPLACE VIEW incomplete_rides_along_with_the_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incomplete_rides_along_with_the_reason;
