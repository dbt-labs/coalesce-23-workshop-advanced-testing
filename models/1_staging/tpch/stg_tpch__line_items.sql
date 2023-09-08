with

source as (
    select * from {{ source('tpch', 'lineitem') }}
),

cleaned as (
    select

        -- ids
        l_orderkey::string as order_id,
        l_suppkey::string as supplier_id,
        l_partkey::string as part_id,
        l_linenumber::string as line_id,

        {{ dbt_utils.generate_surrogate_key([
            'l_orderkey::string',
            'l_linenumber::string'
        ]) }} as order_line_sk,

        {{ dbt_utils.generate_surrogate_key([
            'l_suppkey::string',
            'l_partkey::string'
        ]) }} as part_supplier_sk,

        -- dimensions
        l_returnflag as item_status,
        l_linestatus as line_status,
        l_shipmode as ship_mode,
        l_shipinstruct as shipping_instructions,
        l_comment as comment,

        -- numeric
        l_discount as discount,
        l_extendedprice as extended_price_dollars,
        l_quantity as quantity,
        l_tax as tax_percent,

        -- date/times
        l_shipdate as shipped_on,
        l_commitdate as committed_on,
        l_receiptdate as received_on,

        -- added fields
        round(l_extendedprice * (1 - l_discount), 2) as customer_cost,
        case
            when l_returnflag = 'R'
            then true else false
        end as is_returned

    from source
)

select * from cleaned