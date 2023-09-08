with

customer_order_line_items as (
    select * from {{ ref('fct_customer_order_line_items') }}
),

lost_revenue as (
    select * from {{ ref('rpt_lost_revenue') }}
),

customer_orders as (
    select 
        customer_id,
        customer_name,
        coalesce(round(sum(customer_cost), 2), 0) as purchase_total
    from customer_order_line_items
    where not is_returned
    group by customer_id, customer_name
),

joined as (

    select 

        customer_orders.customer_id,
        customer_orders.customer_name,
        customer_orders.purchase_total,
        lost_revenue.revenue_lost as return_total,
        coalesce(customer_orders.purchase_total - lost_revenue.revenue_lost, 0) as lifetime_value,
        (lost_revenue.revenue_lost/customer_orders.purchase_total)*100 as return_pct

    from customer_orders
    left join lost_revenue
        on customer_orders.customer_id = lost_revenue.customer_id
),

final as (
    select
        *,
        case 
            when return_pct = 0 then 'red' 
            when return_pct <= 25 then 'green' 
            when return_pct <= 50 then 'yellow' 
            when return_pct <= 75 then 'orange' 
            when return_pct <= 100 then 'red' 
        end as customer_status
    from joined
)

select * from final