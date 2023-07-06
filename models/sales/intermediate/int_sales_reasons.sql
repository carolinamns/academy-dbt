with sales_order_header_sales_reasons as (

    select *
    from {{ ref('stg_sales_order_header_sales_reasons') }}

)

, sales_reasons as (

    select *
    from {{ ref('stg_sales_reasons')}}

)

, joins as (

    select
        -- primary keys
        sales_order_header_sales_reasons.sales_order_id

        -- foreign keys
        , sales_reasons.sales_reason_id

        -- properties
        , coalesce(sales_reasons.sales_reason, 'Unknown reason') as sales_reason

    from sales_order_header_sales_reasons
    left join sales_reasons
        on sales_order_header_sales_reasons.sales_reason_id = sales_reasons.sales_reason_id

)

select *
from joins