    /**** Show hotel revenue growing by year? We have two hotel types so it would be good to segment revenue by hotel type. ***/

	/****** Script for SelectTopNRows command from SSMS  ******/
with hotels as (
SELECT *
  FROM [Projects].[dbo].['2018$']
  Union
  SELECT *
  FROM [Projects].[dbo].['2019$']
  Union
  SELECT *
  FROM [Projects].[dbo].['2020$'])


  /**** Exploratory anaylysis**/
Select * from [Projects].[dbo].['Hotel data$']
 /******Find the Revenue***/
 Select (stays_in_weekend_nights+stays_in_week_nights)*adr  as revenue from[Projects].[dbo].['Hotel data$']

 /*** Is hotel Revenue growing by year ***/

  Select  Arrival_date_year, (stays_in_weekend_nights+stays_in_week_nights)*adr  as revenue  from [dbo].['Hotel data$']
  order by Arrival_date_year desc

   /**** group by Year to make it look simpler ***/
   Select  Arrival_date_year, hotel,  Sum((stays_in_weekend_nights+stays_in_week_nights)*adr) as revenue  from [dbo].['Hotel data$']
  group by  Arrival_date_year ,hotel
  Order by arrival_date_year


   /**** Hotel_Total_Request ****/
   
   Select  hotel, count(hotel) Hotel_Total_request  from [dbo].['Hotel data$']
  group by hotel

    /**** Show hotel revenue growing by year? We have two hotel types so it would be good to segment revenue by hotel type. ***/
   Select  Arrival_date_year, hotel,  Sum((stays_in_weekend_nights+stays_in_week_nights)*adr) as revenue  from [dbo].['Hotel data$']
  group by  Arrival_date_year ,hotel
  Order by arrival_date_year

      /**** Reduce result to 2 decimal places  ***/
 
 
 Select  Arrival_date_year, hotel, round( Sum((stays_in_weekend_nights+stays_in_week_nights)*adr,2) as revenue  from [dbo].['Hotel data$']
  group by  Arrival_date_year ,hotel
  Order by arrival_date_year