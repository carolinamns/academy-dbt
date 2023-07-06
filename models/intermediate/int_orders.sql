with sales_order_headers as (

    select *
    from {{ ref('stg_sales_order_headers') }}

)

, sales_order_details as (

    select *
    from {{ ref('stg_sales_order_details') }}

)

, joins as (

    select
        -- primary key
        sales_order_headers.sales_order_id

        -- foreign keys
        , sales_order_details.sales_order_detail_id
        , sales_order_details.product_id
        , sales_order_headers.customer_id
        , sales_order_headers.credit_card_id
        , sales_order_headers.ship_to_address_id
        , sales_order_headers.status_id

        -- timestamps
        , sales_order_headers.order_date

        -- costs and quantities
        , sales_order_details.order_quantity
        , sales_order_details.unit_price
        , sales_order_details.unit_price_discount
        , sales_order_headers.order_subtotal

         -- metrics
        , sales_order_details.unit_price * sales_order_details.order_quantity as gross_sales
        , sales_order_details.unit_price * sales_order_details.order_quantity - (1 - sales_order_details.unit_price_discount) as net_sales

    from sales_order_headers
    inner join sales_order_details
        on sales_order_headers.sales_order_id = sales_order_details.sales_order_id

)

select *
from joins