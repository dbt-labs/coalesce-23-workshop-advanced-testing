with 

source as (
    select * from {{ source('tpch', 'region') }}
),

cleaned as (
    select
        r_regionkey::string as region_id,
        r_name as region,
        r_comment as region_comment
    from source
)

select * from cleaned
union 
select null as region_id, null as region, null as region_comment