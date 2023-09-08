with

nations as (
    select * from {{ ref('base_tpch__nations') }}
),

regions as (
    select * from {{ ref('base_tpch__regions') }}
),

joined as (
    select
        nations.*,
        regions.region,
        regions.region_comment
    from nations
    left join regions on nations.region_id = regions.region_id
)

select * from joined