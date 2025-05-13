with 

source as (

    select * from {{ source('raw', 'POI_tourist_establishments') }}

),

renamed as (

    select
        poi,
        name_reprocessed,
        latitude,
        longitude,
        municipality_code,
        importance,

    from source

)

select * from renamed
