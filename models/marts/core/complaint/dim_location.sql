with location as (

    select
        Incident_Zip as zip,
        Cross_Street_1,
        Cross_Street_2,
        Intersection_Street_1,
        Intersection_Street_2,
        City,
        Borough,
        Unique_Key

    FROM `etl-311323.Motor_Vehicle_Crash.STREET_CONDITION_FULL` 


),

accident as (

    select
        ZIP_CODE as zip,
        COLLISION_ID

    FROM `etl-311323.Motor_Vehicle_Crash.collision`

)



    select
        {{ dbt_utils.surrogate_key('zip', 'Cross_Street_1', 'Cross_Street_2') }} as surrogate_key,
        location.Unique_Key,
        location.zip,
        location.Cross_Street_1,
        location.Cross_Street_2,
        location.Intersection_Street_1,
        location.Intersection_Street_2,
        location.City,
        location.Borough

    from location


    right join accident using (zip)
