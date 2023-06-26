drop table if exists `BikePortfolioProject.BikeGeoPointLine`;

Create table `BikePortfolioProject.BikeGeoPointLine` as (
SELECT ride_id,start_station_name,end_station_name,member_casual,rideable_type,ride_length,st_geogpoint(start_lng,start_lat) OriginPoint, st_geogpoint(end_lng,end_lat) as EndPoint from `BikePortfolioProject.CleanedAllData`);

select OriginPoint, EndPoint from `BikePortfolioProject.BikeGeoPointLine`
limit 5;