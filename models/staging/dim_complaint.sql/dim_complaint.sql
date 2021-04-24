with complaint as (
 
    select
     {{ dbt_utils.surrogate_key('Unique_key') }} as complaint_dim_id,
        Unique_Key,
        Agency_Name,
        Complaint_Type,
        Status
 
    FROM `etl-311323.Motor_Vehicle_Crash.STREET_CONDITION_FULL` 
 
)
 
select * from complaint
