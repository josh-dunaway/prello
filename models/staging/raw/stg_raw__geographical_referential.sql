with 

source as (

    select * from {{ source('raw', 'geographical_referential') }}

),

renamed as (

    select
        municipality_code,
        city_name,
        city_name_normalized,
        municipality_type,
        latitude,
        longitude,
        department_code,
        epci_code,
        department_name

    from source

)

select * from renamed
