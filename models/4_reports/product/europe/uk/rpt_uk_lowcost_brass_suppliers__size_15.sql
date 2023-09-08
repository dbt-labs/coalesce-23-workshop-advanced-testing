with 

filtered_parts as (
    select * from {{ ref('rpt_europe_lowcost_brass_suppliers__size_15') }}
    where supplier_nation = 'UNITED KINGDOM'
),

report_renaming as (
    select
        part_supplier_sk,
        part_name,
        part_retail_price as retailprice,
        supplier_name,
        part_manufacturer,
        supplier_address as suppaddr,
        supplier_phone_number as supp_phone,
        part_supplier_available_qty as num_available
    from filtered_parts
)

select * from report_renaming