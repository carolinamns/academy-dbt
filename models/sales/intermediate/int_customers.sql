with customers as (

    select *
    from {{ ref('stg_customers') }}

)

, people as (

    select *
    from {{ ref('stg_people') }}

)

, stores as (

    select *
    from {{ ref('stg_stores') }}

)

, joins as (

    select
        -- primary key
        customers.customer_id

        -- foreign keys
        , people.person_id
        , stores.store_id

        -- properties
        , case
            when people.person_type_id = 'SC' then 'Store Contact'
            when people.person_type_id = 'IN' then 'Individual Customer'
            when people.person_type_id = 'SP' then 'Sales Person'
            when people.person_type_id = 'EM' then 'Employee'
            when people.person_type_id = 'VC' then 'Vendor Contact'
            when people.person_type_id = 'GC' then 'General Contact'
        end as person_type
        , coalesce(people.full_name, 'unregistered customer') as full_name
        , stores.store_name

    from customers
    left join people
        on customers.person_id = people.person_id
    left join stores
        on customers.store_id = stores.store_id

)

select *
from joins