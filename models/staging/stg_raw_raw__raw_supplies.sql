
with source as (

    select * from {{ source('raw_raw', 'raw_supplies') }}

),

renamed as (

    select
        id,
        name,
        {{ cents_to_dollars('cost') }} as supply_cost,
        cast(perishable as bool) as is_perishable,
        sku

    from source

)

select * from renamed

