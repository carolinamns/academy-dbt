with source as (

    select *
    from {{ source('sap_adw', 'salesorderheader') }}

)

, status as (

    select
        -- primary key
        distinct status as status_id

    from source

)

select *
from status