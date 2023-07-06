with source as (

    select *
    from {{ source('sap_adw', 'creditcard') }}

)

, credit_cards as (

    select
        -- primary key
        creditcardid as credit_card_id

        -- properties
        , cardtype as card_type

    from source
    
)

select *
from credit_cards