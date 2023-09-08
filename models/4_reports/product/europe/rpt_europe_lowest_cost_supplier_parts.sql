with

supplier_parts as (
    select * from {{ ref('fct_supplier_parts') }}
    where supplier_region = 'EUROPE'
    and is_lowest_cost
)

select * from supplier_parts
order by supplier_region