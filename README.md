# Google Data Analytics Case 1: Cyclistic BikeShare

## Introduction
As a Junior Data Analyst at BikeShare Company, I will perform analytic tasks in order to get comprehensive understanding of the consumers trends in 2022. Therefore, as a Junior Data Analyst can answer business questions. I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Quick Links
1. Data Combining.
2. Data Exploration.
3. Data Cleaning.
4. Data GeoPoint Combining
5. Data Analysis.

## About the company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

### Key Findings
1. Finance Analyst have concluded that annual member are much more profitable that casual riders.
2. Maximizing the number of annual members will be the key of future growth.
3. According to the director of marketing, casual riders are already aware of the cyclistic program and have chosen Cyclistic for their mobility needs.

### Scenario

I will work as a Junior Data Analyst in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### Tools 

I used Google BigQuery and Looker Studio (Visualization Tool).

## Ask

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

You will produce a report with the following deliverables:
1. A clear statement of the business task.
2. A description of all data sources used.
3. Documentation of any cleaning or manipulation of data.
4. A summary of your analysis.
5. Supporting visualizations and key findings.
6. Your top three recommendations based on your analysis.

## Prepare

### Data Source

The Cyclistics' history data have been provided from January to December 2022, which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html).The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

### Data Organization

There are 12 data downloaded from the above link which contain 13 columns, there are :
1. ride_id             (STRING)
2. rideable_type       (STRING)
3. started_at          (TIMESTAMP)
4. ended_at            (TIMESTAMP)
5. start_station_name  (STRING)
6. start_station_id    (STRING)
7. end_station_name    (STRING)
8. end_station_id      (STRING)
9. start_lat           (FLOAT)
10. start_lng          (FLOAT)
11. end_lat            (FLOAT)
12. end_lng            (FLOAT)
13. member_casual      (STRING)

## Process

I used BigQuery to combine 12 data into one dataset. The combined dataset has more than 5.6 million rows and analytic tools like Microsoft Excel and Spreadsheet can only process 1,048,576 rows. It is recommended to use tool like Bigquery to process huge amount of data.

### Combining Process
Query --> Combining Process
Monthly data (12 csv files) are uploaded to Bigquery as tables in dataset then "combined data" is created, containing 5,667,717 rows of data for the entire year.

### Exploration Process
Query --> Exploration Process
In this process, I want to dig deeper of how the "combined data" look like.

1. The table below shows the all column names and their data types. We will set ride_id as our primary key.
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/de33ae06-b7b6-4938-918a-0ecf69169b58)

2. Below tables show number of null values in each columns. There are missing values in start_station_name, start_station_id, end_station_name, end_station_id,      end_lat, and end_lng:

   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/2a8e83ba-3006-4d50-9f32-3c75a45fbde0)
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/a7886d6a-aff5-44f9-83f5-57032229f4ad)

   * Total of 833,064 rows for start_station_name and start_station_id is **null**.
   * Total of 892,742 rows for end_station_name and end_station_id is **null**.
   * Total of 5,858 rows for end_lat and end_lng is **null**.
   * All of this null will be removed later. 
    
3. Since I will set ride_id as primary key, I checked if there is duplicates in our ride_id column. There are no duplicate in ride_id column.
   
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/d0db8da0-b5c1-45fc-ab07-8a983348ee62)
  
4. There are 3 unique types of bikes in rideable_type.
   
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/231b9150-83dd-4076-b1b1-d87a76331325)

5. The started_at and ended_at column show start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. From these columns, we can extract other date format    like month and day, that we will use later for our visualization.
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/fc3ea646-0ad0-4c9a-afd7-8387830ea81e)

6. member_casual column has only two unique values.
   ![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/05e8c04a-8697-4768-94fb-318a973ba1d4)

### Cleaning Process
Query --> Cleaning Process
1. Total 1,375,912 rows are removed in this process.
2. All the rows having missing values are deleted.
3. Trips with duration less than a minute and longer than a day are excluded.
4. ride_length are added.

### Geopoint Creation on Bigquery
* Query         --> Analyze Process


## Analyze & Share

* Query         --> Analyze Process
* Visualization --> Looker Studio

The crucial question at the beginning is _**How do annual members and casual riders use Cyclistic bikes differently?**_ 

![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/702a1401-2c7e-45ca-8a43-d3df5f834ac8)
   
  
![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/1a050034-141a-4eca-acc8-e36d415db427)


![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/5c8d11ba-c496-4169-9e28-719e3b81d1ad)


![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/16fe9e6a-04b7-4f21-aa29-c537ef3b89e3)


![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/7d929d28-7932-4838-b296-657f5ad3c481)


![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/4a76b7d2-a5a0-4f4a-8baf-4a96d3d256b6)


![image](https://github.com/adnijufr1/Case_1-Cyclistic_BikeShare_Report/assets/108950455/0b1fec8b-18e1-4015-b1fc-278249094b1a)


## Act

### Annual Members

1. Riding time are concentrated during commute hours ( 8 a.m. - 5 p.m.) and are likely to use bike on weekdays.
2. Travel more frequently with shorter routes and spent riding time less than casual riders.
3. Is likely to start and end trips in residential, downtown and commercial areas.

### Casual Riders

1. Use bike throughout the day, more frequently over the weekend.
2. Spent more riding times compare to member riders.
3. Is likely to start and end trips in museum, parks, and along the coast.

### Conclusion & Recommendation

After considerate analysis with Bigquery and Looker Studio, I want to share my conclusion & recommendation for this analysis, also further analysis recommendation.

1. Number of bikers reached its peak in July for both member and casual riders. Additionally there is an increase of bikers during Spring - Summer season where people are more likely to use bike. In this period of time, marketing campaigns should be more conducted than usual.

2. Streeter Dr & Grand Ave is the most concentrated start and end station.

3. Casual spent more riding time than annual member. Offering discounts or bundling package for longer rides could attract more casual riders and enticing annual member to spend more riding time.

4. Ellis Ave & 60th St -- University Ave & 57th St is the busiest lane for Annual Member with 5,847 trips recorded.

5. Streeter Dr & Grand Ave -- Streeter Dr & Grand Ave is the busiest lane for Casual riders with 9,703 trips recorded (See Slide 10). With this high number promotional flyers and creative road ads should be placed in order to convert more casual riders into annual member.

6. Casual riders are active during the weekend, therefore offering seasonal or weekend only membership is beneficial for company and users.

### Further Analysis Recommendation

1. Riders Projectory should be visualized and analyzed with proper tool. I recommend to use Python to create line map to give more insightful and interactive report (I might do this later in the future).

2. This report should be compared with previous annual report (e.g. year 2021,2020,2019) so the board of members are well informed the growth of this company every year.

3. Both annual members and casual riders data are not known characteristically in order to give more accurate marketing campaign. The Company should dig deeper
data to understand customers' opinion of why they are not sign up yet as a member.





 












