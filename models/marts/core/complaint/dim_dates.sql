SELECT 
Row_Number()Over() as date_dim_id,
Format_Date("%Y%%m%d",d) as date_integer,d AS full_date,
Extract(YEAR FROM d) AS year,
Extract(WEEK FROM d) AS year_week,
Extract(DAY FROM d) AS year_day,
Extract(YEAR FROM d) AS fiscal_year,
FORMAT_DATE('%Q',d) AS fiscal_qtr,
EXTRACT(MONTH FROM d) AS month,
FORMAT_DATE('%B', d) AS month,
FORMAT_DATE('%W', d) AS month_name,
FORMAT_DATE('%A', d) AS day_name,
(CASE WHEN FORMAT_DATE('%A',d) IN ('Sunday','Saturday')
Then 0 ELSE 1 END) AS day_is_weekday,
FROM(
    SELECT* FROM 
    UNNEST(GENERATE_DATE_ARRAY('2015-01-01', '2023-01-01', INTERVAL 1 DAY) ) AS d)
