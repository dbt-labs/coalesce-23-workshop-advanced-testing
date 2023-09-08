with

customers as (
    select * from {{ ref('base_tpch__customers') }}
),

locations as (
    select * from {{ ref('base_tpch__locations') }}
),

joined as (
    select
        customers.*,
        locations.nation as customer_nation,
        locations.nation_comment as customer_nation_comment,
        locations.region as customer_region,
        locations.region_comment as customer_region_comment
    from customers
    left join locations
        on customers.nation_id = locations.nation_id
)

select * from joined