-- Combine all 12 months data 
Drop table if exists `BikePortfolioProject.Combined_Data`;

create table `BikePortfolioProject.Combined_Data` AS ( 
select * from `BikePortfolioProject.January`
union all
select * from `BikePortfolioProject.February`
union all
select * from `BikePortfolioProject.March`
union all 
select * from `BikePortfolioProject.April`
union all
select * from `BikePortfolioProject.May`
union all
select * from `BikePortfolioProject.June`
union all
select * from `BikePortfolioProject.July`
union all
select * from `BikePortfolioProject.August`
union all
select * from `BikePortfolioProject.September`
union all
select * from `BikePortfolioProject.October`
union all
select * from  `BikePortfolioProject.November`
union all
select * from `BikePortfolioProject.December` 
);


select count(*) from `BikePortfolioProject.Combined_Data`;