with 

source as (

    select * from {{ source('raw', 'average_salary_by_municipality') }}

),

renamed as (

    select
        municipality_code,
        avg_net_salary,
        year,

    from source

)

select * from renamed
