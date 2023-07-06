
with int_customers as (

    select *
    from {{ ref('int_customers') }}

)

, dim_customers as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_customers.customer_id']) }} as customer_sk
        , *

    from int_customers
    
)

select *
from dim_customers