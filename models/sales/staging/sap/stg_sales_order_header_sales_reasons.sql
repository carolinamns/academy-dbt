with source as (

    select *
    from {{ source('sap_adw', 'salesorderheadersalesreason') }}

)

, sales_order_header_sales_reasons as (

    select

        -- primary key
        salesorderid as sales_order_id

        -- foreign keys
        , salesreasonid as sales_reason_id

    from source
    
)

select *
from sales_order_header_sales_reasons