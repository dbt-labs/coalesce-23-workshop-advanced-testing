with 

eu_parts_filtered as (
    select * from {{ ref('rpt_europe_lowcost_brass_suppliers') }}
    where part_size = 15
),

report as (
    select
        part_supplier_sk,
        part_name, 
        part_size, 
        part_retail_price, 
        supplier_account_balance, 
        supplier_name,
        supplier_nation, 
        part_id, 
        part_manufacturer, 
        supplier_address, 
        supplier_phone_number, 
        supplier_comment,
        part_supplier_available_qty
    from eu_parts_filtered
    order by 
        supplier_account_balance desc, 
        supplier_nation, 
        supplier_name, 
        part_id
)

select * from report