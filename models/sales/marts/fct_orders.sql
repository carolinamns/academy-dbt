with int_orders as (

    select *
    from {{ ref('int_orders') }}

)

, fct_orders as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_orders.sales_order_id', 'sales_order_detail_id']) }} as sales_order_sk

        -- foreign keys
        , {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk
        , {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk
        , {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_sk
        , {{ dbt_utils.generate_surrogate_key(['ship_to_address_id']) }} as ship_address_sk
        , {{ dbt_utils.generate_surrogate_key(['status_id']) }} as status_sk
        , {{ dbt_utils.generate_surrogate_key(['order_date']) }} as order_date_sk

        , *

    from int_orders
    
)

select *
from fct_orders