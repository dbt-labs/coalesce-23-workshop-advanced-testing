with

orders as (
    select * from {{ ref('stg_tpch__orders') }}
),

customers as (
    select * from {{ ref('stg_tpch__customers') }}
),

enriched as (
    select 

        {{ dbt_utils.generate_surrogate_key([
            'orders.order_id', 
            'customers.customer_id'
        ]) }} as customer_order_sk,
        customers.nation_id,
        customers.customer_name,
        customers.customer_address,
        customers.customer_phone_number,
        customers.customer_account_balance,
        customers.customer_market_segment, 
        customers.customer_comment,
        customers.customer_nation,
        orders.*,

        -- added fields
        case
            when customers.customer_id is null
            then false else true
        end as is_valid_customer,
        
        case
            when order_id is null
            then false else true
        end as is_valid_order
        
    from customers
    full outer join orders on orders.customer_id = customers.customer_id
)

select * from enriched