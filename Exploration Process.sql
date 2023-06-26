--Number of null values in each rows 
select count(*) - count(ride_id) ride_id,
 count(*) - count(rideable_type) rideable_type,
 count(*) - count(started_at) started_at,
 count(*) - count(ended_at) ended_at,
 count(*) - count(start_station_name) start_station_name,
 count(*) - count(start_station_id) start_station_id,
 count(*) - count(end_station_name) end_station_name,
 count(*) - count(end_station_id) end_station_id,
 count(*) - count(start_lat) start_lat,
 count(*) - count(start_lng) start_lng,
 count(*) - count(end_lat) end_lat,
 count(*) - count(end_lng) end_lng,
 count(*) - count(member_casual) member_casual
from `BikePortfolioProject.Combined_Data`;

-- check for duplicate row IDs and length of ride ID
select count(ride_id) - count(distinct ride_id) as duplicates_in_ride_id
from `BikePortfolioProject.Combined_Data`;

select length(ride_id) as ride_id_length, count(ride_id) as no_of_rows from `BikePortfolioProject.Combined_Data`
group by ride_id_length;

-- Rideable Types and number of trips
select distinct rideable_type, count(rideable_type) as no_of_trips
from `BikePortfolioProject.Combined_Data`
group by rideable_type; 

-- started at, ended at data format
select started_at, ended_at from `BikePortfolioProject.Combined_Data`
limit 5;

-- more than one day bike trips
select count(*) as longer_than_a_day
from `BikePortfolioProject.Combined_Data`
where (
  extract(HOUR from (ended_at - started_at)) * 60 +
  extract(MINUTE from (ended_at - started_at)) +
  extract(SECOND from (ended_at - started_at)) / 60) >= 1440; 
  -- 1440 minutes is number of minute in one day total

  -- less than one day a minute trip
  select count(*) a_less_than_a_minute
  from `BikePortfolioProject.Combined_Data`
  where(
    extract(hour from (ended_at - started_at))*60 +
    extract(minute from (ended_at - started_at)) +
    extract(second from (ended_at - started_at))/ 60 <= 1
  );

  -- start station name, start id, end station name, end id (including null values)

  select count(distinct (start_station_name)) from `BikePortfolioProject.Combined_Data`;

  select count(distinct (end_station_name)) from `BikePortfolioProject.Combined_Data`;

  select count(distinct (start_station_id)) from `BikePortfolioProject.Combined_Data`;

  select count(distinct (end_station_id)) from `BikePortfolioProject.Combined_Data`;

select count(ride_id) as rows_with_start_station_null          
from `BikePortfolioProject.Combined_Data`
where start_station_name is null or start_station_id is null;

select count(ride_id) rideID_NUll_endstation from `BikePortfolioProject.Combined_Data`
where end_station_name is null or end_station_id is null;

-- start_lat, end_lng (including NULL values)
select count(ride_id) null_start_loc
from `BikePortfolioProject.Combined_Data`
where start_lat is null or start_lng is null;

-- end_lat, end_lng (including NULL values)

select count(ride_id) as rows_with_null_end_loc
from `BikePortfolioProject.Combined_Data`
where end_lat is null or end_lng is null;

-- member_casual - 2 unique values - member and casual riders

select distinct member_casual, count(member_casual) as no_of_trips
from `BikePortfolioProject.Combined_Data`
group by member_casual;
