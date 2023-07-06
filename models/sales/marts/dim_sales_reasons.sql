with int_sales_reasons as (

    select *
    from {{ ref('int_sales_reasons') }}

)

, dim_sales_reasons as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_sales_reasons.sales_order_id']) }} as sales_reason_sk
        , *

    from int_sales_reasons
    
)

select *
from dim_sales_reasons