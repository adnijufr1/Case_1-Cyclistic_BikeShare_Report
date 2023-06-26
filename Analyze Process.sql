--Analyze Process

select member_casual, rideable_type, count(*) as total_trip
from `BikePortfolioProject.Cleaned_All_Data`
group by member_casual, rideable_type
order by member_casual, rideable_type;

select member_casual, month, count(ride_id) as total_trip
from `BikePortfolioProject.Cleaned_All_Data`
group by month, member_casual
order by member_casual ;

select member_casual, day_of_week, count(ride_id) as total_trip
from `BikePortfolioProject.Cleaned_All_Data`
group by day_of_week, member_casual
order by member_casual ;

select extract(hour from(started_at)) as hour_of_day, member_casual, count(ride_id) as total_trip
from `BikePortfolioProject.Cleaned_All_Data`
group by hour_of_day, member_casual 
order by total_trip desc;

select month, member_casual, round(avg(ride_length),2) as ride_length_duration
from `BikePortfolioProject.Cleaned_All_Data`
group by month, member_casual
order by member_casual;

select day_of_week, member_casual, round(avg(ride_length),2) as ride_length_duration
from `BikePortfolioProject.Cleaned_All_Data`
group by day_of_week, member_casual
order by member_casual;

select extract(hour from(started_at)) as hour_of_day, member_casual, round(avg(ride_length),2) as ride_length_duration
from `BikePortfolioProject.Cleaned_All_Data`
group by hour_of_day, member_casual
order by member_casual;

select start_station_name, member_casual,
avg(start_lat) as start_lat, avg(start_lng) as start_lng,
count(ride_id) as total_trips
from `BikePortfolioProject.Cleaned_All_Data`
group by start_station_name, member_casual
order by total_trips desc;


select end_station_name, member_casual,
avg(end_lat) as end_lat, avg(end_lng) as end_lng,
count(ride_id) as total_trips
from `BikePortfolioProject.Cleaned_All_Data`
group by end_station_name, member_casual
order by total_trips desc;
