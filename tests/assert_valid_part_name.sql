select * from {{ ref('stg_tpch__parts') }}
where part_name = 'TEST'