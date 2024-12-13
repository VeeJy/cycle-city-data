SELECT TOP (1000) [dteday]
      ,[season]
      ,[yr]
      ,[mnth]
      ,[hr]
      ,[holiday]
      ,[weekday]
      ,[workingday]
      ,[weathersit]
      ,[temp]
      ,[atemp]
      ,[hum]
      ,[windspeed]
      ,[rider_type]
      ,[riders]
  FROM [bike_data].[dbo].[bike_share_yr_0];

  --joining the two tables
 SELECT *
  FROM bike_share_yr_0
	UNION all
    SELECT *
  FROM bike_share_yr_1

  --cost of the join
  SELECT * 
  FROM cost_table

  --left join cost_table to the union
  with cte as (
 SELECT *
  FROM bike_share_yr_0
	UNION all
    SELECT *
  FROM bike_share_yr_1)

  SELECT * 
  FROM cte a
  left join cost_table b
  on a.yr = b.yr

  ---calculate revenue and profit and update to the table
  with cte as (
 SELECT *
  FROM bike_share_yr_0
	UNION all
    SELECT *
  FROM bike_share_yr_1)

  SELECT dteday, season, a.yr, weekday, hr, rider_type, riders, price, COGS,
  riders*price as revenue,
  riders*price -COGS as profit
  FROM cte a 
  left join cost_table b
  on a.yr = b.yr

