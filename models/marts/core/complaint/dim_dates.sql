with Date as(
    select
       {{ dbt_utils.surrogate_key('Created_Date','Closed_Date') }} as surrogate_key,
        Created_Date,
        Closed_Date
 
    FROM `etl-311323.Motor_Vehicle_Crash.STREET_CONDITION_FULL`
)
select * from Date

