with

customer_orders as (
    select * from {{ ref('int_customer_orders') }}
    where is_valid_customer and is_valid_order
)

select * from customer_orders