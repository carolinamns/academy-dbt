with source as (

    select *
    from {{ source('sap_adw', 'productsubcategory') }}

)

, product_subcategories as (

    select
        -- primary key
        productsubcategoryid as product_subcategory_id

        -- foreign keys
        , productcategoryid as product_category_id

        -- properties
        , name as product_subcategory_name

    from source
    
)

select *
from product_subcategories