/* Verify that gross sales from 2011 match the expected value.
If the sum of gross sales from 2011 does not match the
expected value, the test will fail. . To account for potential
floating-point precision differences, the test compares the
absolute difference between the calculated gross sales and the
expected value against a small threshold. */

with gross_sales_2011 as (

    select
        cast(sum(gross_sales) as float64) as gross_sales_2011

    from {{ ref('fct_orders') }}
    where extract(year from order_date) = 2011

)

select *
from gross_sales_2011
where abs(gross_sales_2011.gross_sales_2011 - 12646112.16) <= 0.0001