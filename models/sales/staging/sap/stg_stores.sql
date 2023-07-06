with source as (

    select *
    from {{ source('sap_adw', 'store') }}

)

, stores as (

    select
        -- primary key
        businessentityid as store_id

        -- foreign keys
        , name as store_name

    from source
    
)

select *
from stores