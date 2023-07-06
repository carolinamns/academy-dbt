with int_products as (

    select *
    from {{ ref('int_products') }}

)

, dim_products as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_products.product_id']) }} as product_sk
        , *

    from int_products
    
)

select *
from dim_products