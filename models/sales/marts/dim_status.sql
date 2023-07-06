with int_status as (

    select *
    from {{ ref('int_status') }}

)

, dim_status as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_status.status_id']) }} as status_sk
        , *

    from int_status
    
)

select *
from dim_status