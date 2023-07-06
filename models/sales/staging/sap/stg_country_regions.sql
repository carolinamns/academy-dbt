with source as (

    select *
    from {{ source('sap_adw', 'countryregion') }}

)

, country_regions as (

    select
        -- primary key
        countryregioncode as country_region_code

        -- properties
        , name as country_region_name

    from source

)

select *
from country_regions