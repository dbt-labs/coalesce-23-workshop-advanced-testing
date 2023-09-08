with 

source as (
    select * from {{ source('tpch', 'part') }}
),

cleaned as (
    select
        p_partkey::string as part_id,
        p_name as part_name,
        p_mfgr as part_manufacturer,
        p_brand as part_brand,
        p_type as part_type,
        p_size as part_size,
        p_container as part_container,
        p_retailprice as part_retail_price,
        p_comment as part_comment,

        case 
            when p_type like '%BRASS'
            then 'brass'
            else p_type
        end as part_material
    from source
)

select * from cleaned