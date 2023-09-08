with 

source as (
    select * from {{ source('tpch', 'supplier') }}
),

cleaned as (
    select
        s_suppkey::string as supplier_id,
        s_nationkey::string as nation_id,
        s_name as supplier_name,
        s_address as supplier_address,
        s_phone as supplier_phone_number,
        s_acctbal as supplier_account_balance,
        s_comment as supplier_comment
    from source
)

select * from cleaned