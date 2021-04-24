with location as (
    select
     {{ dbt_utils.surrogate_key('Incident_Zip') }} as location_dim_key,
     {{ dbt_utils.surrogate_key('Unique_key') }} as complaint_dim_id,
    Row_Number()Over() as complaint_count,

     from `etl-311323.Motor_Vehicle_Crash.STREET_CONDITION_FULL` 
      
     order by complaint_count asc 
)

select * from location

