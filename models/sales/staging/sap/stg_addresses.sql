with source as (

    select *
    from {{ source('sap_adw', 'address') }}

)

, addresses as (

    select
        -- primary key
        addressid as address_id

        -- foreign keys
        , stateprovinceid as state_province_id

        -- properties
        , city as city_name

    from source
    
)

select *
from addresses