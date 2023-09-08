with 

line_items as (
    select * from {{ ref('stg_tpch__line_items') }}
),

orders as (
    select * from {{ ref('int_customer_orders') }}
),

final as (
    select 

        {{ dbt_utils.generate_surrogate_key([
            'orders.customer_order_sk',
            'line_items.order_line_sk'
        ]) }} as customer_order_line_item_sk,
        
        orders.customer_order_sk,
        orders.customer_id,
        orders.order_priority,
        orders.order_shipping_priority,
        orders.order_clerk_name,
        orders.order_status,
        orders.order_comment,
        orders.order_total_price_dollars,
        orders.order_date,
        orders.nation_id,
        orders.customer_name,
        orders.customer_address,
        orders.customer_phone_number,
        orders.customer_account_balance,
        orders.customer_market_segment, 
        orders.customer_comment,
        orders.customer_nation,
        orders.is_valid_customer,
        orders.is_valid_order,
        line_items.*

    from orders
    left join line_items on line_items.order_id = orders.order_id
)

select * from final