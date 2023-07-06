with source as (

    select *
    from {{ source('sap_adw', 'productcategory') }}

)

, product_categories as (

    select
        -- primary key
        productcategoryid as product_category_id

        -- properties
        , name as product_category_name

    from source
    
)

select *
from product_categories