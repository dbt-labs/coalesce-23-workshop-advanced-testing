with

returned_order_line_items as (
    select * from {{ ref('fct_customer_order_line_items') }}
    where is_valid_customer 
    and is_valid_order
    and item_status = 'R'
)

select 
    date_trunc('month', order_date) as month,
    round(sum(customer_cost), 2) AS return_total,
    count(distinct order_id) as orders_with_returns,
    count(customer_order_line_item_sk) as items_returned
from returned_order_line_items
group by month
order by month