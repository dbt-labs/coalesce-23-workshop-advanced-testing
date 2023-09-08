with 

source as (
    select * from {{ source('tpch', 'nation') }}
),

cleaned as (
    select
        n_nationkey::string as nation_id,
        n_regionkey::string as region_id,
        n_name as nation,
        n_comment as nation_comment
    from source
)

select * from cleaned