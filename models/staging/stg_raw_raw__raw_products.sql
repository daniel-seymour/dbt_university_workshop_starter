
with source as (

    select * from {{ source('raw_raw', 'raw_products') }}

),

renamed as (

    select
        sku,
        name,
        type,
        {{ cents_to_dollars('price') }} as product_price,
        description

    from source

)

select * from renamed

