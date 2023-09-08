with

line_items as (
    select * from {{ ref('fct_customer_order_line_items') }}
    where is_valid_order 
    and is_valid_customer 
    and is_returned
),

order_lines as (
    select
        customer_id,
        customer_name,
        customer_account_balance,
        customer_nation, 
        customer_address,
        customer_phone_number,
        customer_comment,
        coalesce(sum(customer_cost),0) AS revenue_lost
    from line_items
    group by 1, 2, 3, 4, 5, 6, 7
)

select * from order_lines 
order by revenue_lost desc