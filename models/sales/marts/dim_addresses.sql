with int_addresses as (

    select *
    from {{ ref('int_addresses') }}

)

, dim_addresses as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['int_addresses.address_id']) }} as address_sk
        , *

    from int_addresses
    
)

select *
from dim_addresses