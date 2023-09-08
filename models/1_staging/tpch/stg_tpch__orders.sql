with

source as (
    select * from {{ source('tpch', 'orders') }}
),

cleaned as (
    select 

        -- ids
        o_orderkey::string as order_id,
        o_custkey::string as customer_id,

        -- dimensions
        o_orderpriority as order_priority,
        o_shippriority as order_shipping_priority,
        o_clerk as order_clerk_name,
        o_orderstatus as order_status,
        o_comment as order_comment,

        -- numeric
        o_totalprice as order_total_price_dollars,

        -- date/times
        o_orderdate as order_date
        
    from source
)

select * from cleaned