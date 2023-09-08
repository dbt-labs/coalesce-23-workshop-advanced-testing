with

europe_lowcost_suppliers as (
    select * from {{ ref('rpt_europe_lowest_cost_supplier_parts') }}
    where supplier_nation = 'UNITED KINGDOM'
)

select * from europe_lowcost_suppliers