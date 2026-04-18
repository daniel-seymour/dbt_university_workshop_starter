
with source as (

    select * from {{ source('raw_raw', 'raw_stores') }}

),

renamed as (

    select
        id,
        name,
        opened_at,
        tax_rate

    from source

)

select * from renamed

