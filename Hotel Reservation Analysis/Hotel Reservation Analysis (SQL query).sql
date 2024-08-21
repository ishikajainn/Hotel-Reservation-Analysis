# Importing datasetselect 
SELECT * FROM hotel_reservation_dataset


# 1. What is the total number of reservations in the dataset?  
SELECT COUNT(*) AS total_reservations
FROM hotel_reservation_dataset


# 2. Which meal plan is the most popular among guests? 
SELECT type_of_meal_plan, COUNT(*) AS count
FROM hotel_reservation_dataset
GROUP BY type_of_meal_plan
ORDER BY count DESC;


# 3. What is the average price per room for reservations involving children?
SELECT SUM(avg_price_per_room) AS Avg_price_per_room
FROM hotel_reservation_dataset
WHERE no_of_children > 0;


# Modifying arrival_date column datatype to date by creating new column
ALTER TABLE hotel_reservation_dataset ADD COLUMN arrival_dates DATE;

UPDATE hotel_reservation_dataset 
SET arrival_dates = STR_TO_DATE(arrival_date, '%d-%m-%Y');

SELECT arrival_date, arrival_dates 
FROM hotel_reservation_dataset 
WHERE arrival_dates IS NULL;

# dropping old column
ALTER TABLE hotel_reservation_dataset DROP COLUMN arrival_date;

# renaming the column
ALTER TABLE hotel_reservation_dataset CHANGE arrival_dates arrival_date DATE;


# 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  
SELECT COUNT(*) AS total_reservations
FROM hotel_reservation_dataset
WHERE YEAR(arrival_date) = 2017;


# 5. What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(*) AS count
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
ORDER BY count DESC;


# 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
SELECT COUNT(*) AS No_of_Weekend_reservations
FROM hotel_reservation_dataset
WHERE no_of_weekend_nights > 0;


# 7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time), MIN(lead_time)
FROM hotel_reservation_dataset;


# 8. What is the most common market segment type for reservations?  
SELECT market_segment_type, COUNT(*) AS No_of_Reservations
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY No_of_Reservations DESC;


# 9. How many reservations have a booking status of "Confirmed"? 
SELECT COUNT(*) AS Confirmed_reservations
FROM hotel_reservation_dataset
WHERE booking_status = 'Not_Canceled';


# 10. What is the total number of adults and children across all reservations?  
SELECT SUM(no_of_adults) AS Total_Adults,
SUM(no_of_children) AS Total_Children
FROM hotel_reservation_dataset;


# 11. What is the average number of weekend nights for reservations involving children? 
SELECT AVG(no_of_weekend_nights) AS Avg_weekend_nights
FROM hotel_reservation_dataset
WHERE no_of_children > 0;


# 12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS MONTH,
COUNT(*) AS No_of_Reservations
FROM hotel_reservation_dataset
GROUP BY MONTH(arrival_date);


# 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
SELECT room_type_reserved AS Room_type,
ROUND(AVG(no_of_weekend_nights + no_of_week_nights),1) AS Avg_Nights
FROM hotel_reservation_dataset
GROUP BY room_type_reserved;


#14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, COUNT(*) AS Count,
SUM(avg_price_per_room) AS Avg_price_per_room
FROM hotel_reservation_dataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC;


# 15. Find the market segment type that generates the highest average price per room. 
SELECT market_segment_type, avg_price_per_room
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC;

