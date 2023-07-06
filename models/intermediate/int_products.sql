with products as (

    select *
    from {{ ref('stg_products') }}

)

, product_categories as (

    select *
    from {{ ref('stg_product_categories') }}

)

, product_subcategories as (

    select *
    from {{ ref('stg_product_subcategories') }}

)

, joins as (

    select
        -- primary keys
        products.product_id

        -- foreign keys
        , product_categories.product_category_id
        , product_subcategories.product_subcategory_id

        -- properties
        , products.product_name
        , product_categories.product_category_name
        , product_subcategories.product_subcategory_name

    from products
    left join product_subcategories
        on products.product_subcategory_id = product_subcategories.product_subcategory_id
    left join product_categories
        on product_subcategories.product_category_id = product_categories.product_category_id

)

select *
from joins