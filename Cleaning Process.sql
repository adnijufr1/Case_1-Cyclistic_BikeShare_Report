drop table if exists `BikePortfolioProject.Cleaned_All_Data`;

create table `BikePortfolioProject.Cleaned_All_Data` as (
  select a.ride_id, rideable_type,started_at,ended_at,ride_length,
  case extract (dayofweek from started_at)
    when 1 then "SUNDAY"
    when 2 then "MONDAY"
    when 3 then "TUESDAY"
    when 4 then "WEDNESDAY"
    when 5 then "THURSDAY"
    when 6 then "FRIDAY"
    when 7 then "SATURDAY"
    end as day_of_week,
   case extract (month from started_at)
    when 1 then "JANUARY"
    when 2 then "FEBRUARY"
    when 3 then "MARCH"
    when 4 then "APRIL"
    when 5 then "MAY"
    when 6 then "JUNE"
    when 7 then "JULY"
    when 8 then "AUGUST"
    when 9 then "SEPTEMBER"
    when 10 then "OCTOBER"
    when 11 then "NOVEMBER"
    when 12 then "DECEMBER"
    end as month,
    start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
  FROM `BikePortfolioProject.Combined_Data` a
  join(
    select ride_id, (
      extract (hour from(ended_at-started_at))* 60 +
      extract (minute from(ended_at-started_at))+
      extract (second from(ended_at-started_at))/60) as ride_length
      from `BikePortfolioProject.Combined_Data`
    )b
    on a.ride_id = b.ride_id
    where
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440
);

-- set ride_id as primary key
ALTER TABLE `BikePortfolioProject.Cleaned_All_Data`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;


select count(*) from `BikePortfolioProject.Cleaned_All_Data`;

select * from `BikePortfolioProject.Cleaned_All_Data`
limit 10;



