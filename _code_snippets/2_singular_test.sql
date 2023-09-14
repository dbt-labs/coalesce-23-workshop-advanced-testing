/*

    1. Make a new file called assert_valid_part_name.sql in the /tests folder
    2. Copy and paste the code in this file into your file. Save.
    3. Execute dbt build -s stg_tpch__parts
    4. Inspect the run details

*/

select * from {{ ref('stg_tpch__parts') }}
where part_name = 'TEST'