with source as (

    select *
    from {{ source('sap_adw', 'person') }}

)

, people as (

    select
        -- primary key
        businessentityid as person_id

        -- properties
        , persontype as person_type_id
        , concat(coalesce(firstname, ''), ' ', coalesce(middlename, ''), ' ', coalesce(lastname, '')) as full_name

    from source
    
)

select *
from people