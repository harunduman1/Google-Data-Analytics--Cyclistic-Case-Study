## Data Exploration Stage

## to check the data types of all columns

SELECT column_name, data_type
FROM `cyclist-case-study-1.Alltrips`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';

## to check number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `cyclist-case-study-1.Alltrips.combined_data`;

## to check duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `cyclist-case-study-1.Alltrips.combined_data`;

## ride_id - all have length of 16

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM `cyclist-case-study-1.Alltrips.combined_data`
GROUP BY length_ride_id;

## rideable_type - 3 different types of bikes

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `cyclist-case-study-1.Alltrips.combined_data`
GROUP BY rideable_type;

## started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `cyclist-case-study-1.Alltrips.combined_data`
LIMIT 10;

SELECT COUNT(*) AS longer_than_a_day
FROM `cyclist-case-study-1.Alltrips.combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;   # longer than a day - total rows = 5360

SELECT COUNT(*) AS less_than_a_minute
FROM `cyclist-case-study-1.Alltrips.combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1;      # less than a minute - total rows = 122283

## start_station_name and start_station_id have total 833064 missing rows

SELECT DISTINCT start_station_name
FROM `cyclist-case-study-1.Alltrips.combined_data`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null          ## returned 833064 rows
FROM `cyclist-case-study-1.Alltrips.combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

## end_station_name and end_station_id have total 892742 missing rows

SELECT DISTINCT end_station_name
FROM `cyclist-case-study-1.Alltrips.combined_data`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_null_end_station          -- return 892742 rows
FROM `cyclist-case-study-1.Alltrips.combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

## end_lat and end_lng have total 5858 missing rows

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `cyclist-case-study-1.Alltrips.combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL;

## member_casual - 2 unique values - member and casual riders

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `cyclist-case-study-1.Alltrips.combined_data`
GROUP BY member_casual;