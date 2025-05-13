with 

source as (

    select * from {{ source('raw', 'population_by_municipality') }}

),

renamed as (

    select
        municipality_code,
        year,
        population,

    from source

)

select * from renamed
