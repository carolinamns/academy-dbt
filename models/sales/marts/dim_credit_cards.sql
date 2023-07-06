with stg_credit_cards as (

    select *
    from {{ ref('stg_credit_cards') }}

)

, dim_credit_cards as (

    select
        -- surrogate key
        {{ dbt_utils.generate_surrogate_key(['stg_credit_cards.credit_card_id']) }} as credit_card_sk
        , *

    from stg_credit_cards
    
)

select *
from dim_credit_cards