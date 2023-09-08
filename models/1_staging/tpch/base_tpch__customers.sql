with

source as (
    select * from {{ source('tpch', 'customer') }}
),

cleaned as (
    select 
    
        -- ids
        c_custkey::string as customer_id,
        c_nationkey::string as nation_id,
        
        -- dimensions
        c_name as customer_name,
        c_address as customer_address,
        c_phone as customer_phone_number,
        c_acctbal as customer_account_balance,
        c_mktsegment as customer_market_segment, 
        c_comment as customer_comment

    from source
)

select * from cleaned