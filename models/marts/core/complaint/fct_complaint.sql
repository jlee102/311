with location as (

    select
        distinct (Incident_Zip) as zip,
        Cross_Street_1,
        Cross_Street_2,
        Created_Date,
        Closed_Date,
        Unique_Key

    FROM `etl-311323.Motor_Vehicle_Crash.STREET_CONDITION_FULL` 


),

accident as (

    select
        distinct (ZIP_CODE) as zip,
        COLLISION_ID

    FROM `etl-311323.Motor_Vehicle_Crash.collision`

)



select
    {{ dbt_utils.surrogate_key('Unique_key') }} as complaint_dim_id,
    {{ dbt_utils.surrogate_key('Created_Date','Closed_Date') }} as date_dim_id,
    {{ dbt_utils.surrogate_key('zip', 'Cross_Street_1', 'Cross_Street_2') }} as location_dim_id,
    location.Unique_Key,
    zip,
    row_number()over() as num_row


from location
    
where zip = zip 
group by 1,2,3,4,5
order by num_row asc
