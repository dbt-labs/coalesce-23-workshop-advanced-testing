with 

parts_filtered as (
    select * from {{ ref('rpt_europe_lowest_cost_supplier_parts') }}
    where part_material ilike '%brass%'
)

select * from parts_filtered 