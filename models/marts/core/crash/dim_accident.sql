with accident as (
    select 
         {{ dbt_utils.surrogate_key('COLLISION_ID', 'LOCATION') }} as accident_dim_key,
        COLLISION_ID,
        LOCATION,
        BOROUGH,
        ZIP_CODE,
        ON_STREET_NAME,
        VEHICLE_TYPE_CODE_1
 
    from `etl-311323.Motor_Vehicle_Crash.collision`
 
    order by COLLISION_ID asc
   
)
 
select * from accident
