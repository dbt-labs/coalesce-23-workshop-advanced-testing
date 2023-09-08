with 

suppliers as (
    select * from {{ ref('base_tpch__suppliers') }}
),

locations as (
    select * from {{ ref('base_tpch__locations') }}
),

enriched as (
    select
        suppliers.*,
        locations.nation as supplier_nation,
        locations.nation_comment as supplier_nation_comment,
        locations.region as supplier_region,
        locations.region_comment as supplier_region_comment
    from suppliers
    left join locations on suppliers.nation_id = locations.nation_id
)

select * from enriched