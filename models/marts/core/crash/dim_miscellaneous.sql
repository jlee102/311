with miscellaneous as (

    select
        CONTRIBUTING_FACTOR_VEHICLE_1,
        NUMBER_OF_PERSONS_INJURED,
        COLLISION_ID

    FROM `etl-311323.Motor_Vehicle_Crash.collision` 

)
select
        {{ dbt_utils.surrogate_key('CONTRIBUTING_FACTOR_VEHICLE_1', 'NUMBER_OF_PERSONS_INJURED') }} as MiscID,
        miscellaneous.CONTRIBUTING_FACTOR_VEHICLE_1,
        miscellaneous.NUMBER_OF_PERSONS_INJURED,
    FROM miscellaneous