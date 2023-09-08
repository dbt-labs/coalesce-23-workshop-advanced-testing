with

customers as (
    select * from {{ ref('stg_tpch__customers') }}
) 

select * from customers