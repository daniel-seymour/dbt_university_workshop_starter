
with source as (

    select * from {{ source('raw_raw', 'raw_orders') }}

),

renamed as (

    select
        id,
        customer,
        timestamp(ordered_at) as ordered_at,
        store_id,
        {{ cents_to_dollars('subtotal') }} as order_subtotal,
        {{ cents_to_dollars('tax_paid') }} as order_tax_paid,
        {{ cents_to_dollars('order_total') }} as order_total
    from source
)

select * from renamed

