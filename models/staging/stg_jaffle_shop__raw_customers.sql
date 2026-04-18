-- stg_stripe__payments.sql

with

source as (

    select * from {{ source('raw_raw','raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        name as customer_name
    from source

)

select * from renamed
