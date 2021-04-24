with Crashtime as(
    select
       {{ dbt_utils.surrogate_key('CRASH_DATE', 'CRASH_TIME') }} as surrogate_key,
        CRASH_DATE,
        Crash_TIME,
        COLLISION_ID
 
    FROM `etl-311323.Motor_Vehicle_Crash.collision`
)
select * from Crashtime
