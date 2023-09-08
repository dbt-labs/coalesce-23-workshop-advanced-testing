with

parts as (
    select * from {{ ref('stg_tpch__parts') }}
),

part_suppliers as (
    select * from {{ ref('stg_tpch__part_suppliers') }}
),

suppliers as (
    select * from {{ ref('stg_tpch__suppliers') }}
),

joined as (
    select
        suppliers.supplier_id,
        suppliers.nation_id,
        parts.part_id,

        {{ dbt_utils.generate_surrogate_key([
            'suppliers.supplier_id',
            'parts.part_id'
        ]) }} as part_supplier_sk,

        suppliers.supplier_nation,
        suppliers.supplier_region,

        part_suppliers.part_supplier_available_qty,
        part_suppliers.part_supplier_cost,
        part_suppliers.part_supplier_comment,

        suppliers.supplier_name,
        suppliers.supplier_address,
        suppliers.supplier_phone_number,
        suppliers.supplier_account_balance,
        suppliers.supplier_comment,

        parts.part_name,
        parts.part_manufacturer,
        parts.part_brand,
        parts.part_type,
        parts.part_size,
        parts.part_container,
        parts.part_retail_price,
        parts.part_material,
        parts.part_comment,

        min(part_suppliers.part_supplier_cost) over(
            partition by suppliers.supplier_region, parts.part_id
        ) as lowest_part_cost_in_region
    from suppliers
    left join part_suppliers
        on suppliers.supplier_id = part_suppliers.supplier_id
    left join parts
        on parts.part_id = part_suppliers.part_id
),

enriched as (
    select
        *,
        case
            when part_supplier_cost = lowest_part_cost_in_region
            then true else false
        end as is_lowest_cost
    from joined
)

select * from enriched