with 

source as (
    select * from {{ source('tpch', 'partsupp') }}
),

cleaned as (
    select
        ps_partkey::string as part_id,
        ps_suppkey::string as supplier_id,
        {{ dbt_utils.generate_surrogate_key([
            'ps_partkey::string',
            'ps_suppkey::string'
        ]) }} as part_supplier_sk,

        -- Intentionally added nulls for Advanced Testing workshop
        case
            when ps_availqty = 3640 then null
            else ps_availqty
        end as part_supplier_available_qty,

        ps_supplycost as part_supplier_cost,
        ps_comment as part_supplier_comment
    from source
)

select * from cleaned