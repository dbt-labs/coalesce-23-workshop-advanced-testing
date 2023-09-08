with

europe_lowcost_brass_suppliers as (
    select * from {{ ref('rpt_europe_lowcost_brass_suppliers') }}
    where supplier_nation = 'UNITED KINGDOM'
)

select 
    europe_lowcost_brass_suppliers.part_supplier_sk,
    europe_lowcost_brass_suppliers.part_name,
    europe_lowcost_brass_suppliers.part_retail_price,
    europe_lowcost_brass_suppliers.supplier_name,
    europe_lowcost_brass_suppliers.part_manufacturer,
    europe_lowcost_brass_suppliers.supplier_address,
    europe_lowcost_brass_suppliers.supplier_phone_number,
    europe_lowcost_brass_suppliers.part_supplier_available_qty as number_available
from europe_lowcost_brass_suppliers