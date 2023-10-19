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
select '1111' as region_id, '1' as region, 'blah' as region_comment