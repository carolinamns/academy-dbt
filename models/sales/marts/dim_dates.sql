with int_dates as (

    select *
    from {{ ref('int_dates') }}

)

, dim_dates as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_dates.order_day']) }} as date_sk
        , *

    from int_dates
    
)

select *
from dim_dates