with source as (

    select *
    from {{ source('sap_adw', 'customer') }}

)

, customers as (

    select
        -- primary key
        customerid as customer_id

        -- foreign keys
        , personid as person_id
        , storeid as store_id

    from source
    
)

select *
from customers