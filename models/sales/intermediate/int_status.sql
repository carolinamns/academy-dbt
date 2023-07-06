with status as (

    select *
    from {{ ref('stg_status') }}

)

, transformation as (

    select
        -- primary key
        status_id

        -- properties
        , case
            when status_id = 1 then 'in_process'
            when status_id = 2 then 'approved'
            when status_id = 3 then 'backordered'
            when status_id = 4 then 'rejected'
            when status_id = 5 then 'shipped'
            when status_id = 6 then 'cancelled'
            else 'no_status'
        end as order_status

    from status

)

select *
from transformation