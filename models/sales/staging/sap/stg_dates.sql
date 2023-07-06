with source as (

    select *
    from {{ source('sap_adw', 'salesorderheader') }}

)

, dates as (

    select
        -- primary key
        cast(orderdate as datetime) as order_date

    from source
    
)

select *
from dates