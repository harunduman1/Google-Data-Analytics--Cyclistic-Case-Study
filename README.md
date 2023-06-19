# Google-Data-Analytics-Cyclistic-Case-Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
As a junior data analyst my Google Case Study is Cyclist Bike Share Project. I will follow Ask, Prepare, Process, Analyze, Share, and Act steps in this work.

# Quick Links
I've worked with data on 5 Stages which are:

1. [Data Combining](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/1.%20Data%20Combining%20Stage.sql)
2. [Data Exploration](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/2.%20Data%20Exploration%20Stage.sql)
3. [Data Cleaning](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/3.Data%20Cleaning.sql)
4. [Data Analysis](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/4.%20Data%20Analysis.sql)
5. Data Visulizations: [Tableu]

Data Source: [Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

# Informations

## Cyclistic Bike Share

A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
# Scenario
I will do this project as a junior data analyst at Cyclistic in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

# Ask
## Business Task
Develope marketing strategies to convert casual riders to members.

## Analysis Questions
Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

# Prepare
## Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2022 to Dec 2022 which can be downloaded from divvy_tripdata. The data has been made available by Motivate International Inc. under this license.

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

## Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

# Process
BigQuery is used to combine the various datasets into one dataset and clean it.
Reason:
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.

## Combining the Data
SQL Query: [Data Combining](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/1.%20Data%20Combining%20Stage.sql)
12 csv files are uploaded as tables in the dataset 'Alltrips'. Another table named "combined_data" is created, containing 5,667,717 rows of data for the entire year.

## Data Exploration
SQL Query: [Data Exploration](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/2.%20Data%20Exploration%20Stage.sql)
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.

Observations:

1. The table below shows the all column names and their data types. The ride_id column is our primary key.

![File Type](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/1fe8505d-b253-42df-b21c-0f1da4ae5223)

2. The following table shows number of null values in each column.

![Null Values](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/8ef93ab7-aa0a-4e3a-9754-21bf71b0ccf2)

3. As ride_id has no null values, let's use it to check for duplicates.

![Dublicates](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/b55863fe-bbfb-4cc4-a20c-cc14a01cb1bf)

4. All ride_id values have length of 16 so no need to clean it.

![Ride Length](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/7a808ee5-730c-420e-b6f1-fa69c6c918ce)

5. There are 3 unique types of bikes(rideable_type) in our data.

![Rideable Types](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/841b86d1-dbf3-4af0-8166-6884b058c552)

6. The started_at and ended_at shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 5360 trips which has duration longer than a day and 122283 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.

![Less than a minute](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/60743c45-9604-4d2e-af94-a498f46fa083)
![Longer than a day](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/ceff379c-e761-429e-bd9c-b21a0b96ffa7)

7. Total of 833064 rows have both start_station_name and start_station_id missing which needs to be removed.

![Number of Station Name or Id Missing](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/c17175f2-99eb-4a23-bacd-795e00e040a9)

8. Total of 892742 rows have both end_station_name and end_station_id missing which needs to be removed.

![Number of Null Station or ID](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/a86ab97a-7245-4ff9-9256-848574d2c06e)

9. Total of 5858 rows have both end_lat and end_lng missing which needs to be removed.

![Number of Null Station or ID 2](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/699f8b39-0bce-48aa-8fb9-28c0f3479cd8)

10. member_casual column has 2 uniqued values as member or casual rider.

![Number of Casual and Members](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/assets/53931381/6d9d160f-d4df-42e6-afd8-c39ee78c3320)

11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.

# Data Cleaning
SQL Query: [Data Cleaning](https://github.com/orochimo/Google-Data-Analytics--Cyclistic-Case-Study/blob/main/3.Data%20Cleaning.sql)

1. All the rows having missing values are deleted.
2. 3 more columns ride_length for duration of the trip, day_of_week and month are added.
3. Trips with duration less than a minute and longer than a day are excluded.
4. Total 1,375,912 rows are removed in this step.





































