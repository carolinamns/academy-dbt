with addresses as (

    select *
    from {{ ref('stg_addresses') }}

)

, state_provinces as (

    select *
    from {{ ref('stg_state_provinces') }}

)

, country_regions as (

    select *
    from {{ ref('stg_country_regions') }}

)

, joins as (

    select
        -- primary key
        addresses.address_id

        -- foreign keys
        , country_regions.country_region_code
        , state_provinces.state_province_id

        -- properties
        , addresses.city_name
        , country_regions.country_region_name
        , state_provinces.state_province_name
        
    from addresses
    left join state_provinces
        on addresses.state_province_id = state_provinces.state_province_id
    left join country_regions
        on state_provinces.country_region_code = country_regions.country_region_code

)

select *
from joins