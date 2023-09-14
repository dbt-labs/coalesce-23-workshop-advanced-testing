/*

    1. Create a folder called generic in your /tests folder (/tests/generic/)
    2. Create a file called has_valid_value.sql in your /generic folder
    3. Copy and paste the code in this file in your file. Save.
    4. Open the /models/1_staging/tpch/_models.yml file and add
       this column definition under stg_tpch__part's columns key:
        - name: part_name
          tests:
            - has_valid_value:
                value: 'TEST'
        Your YML file should look like the file 3_custom_generic_test_config.yml,
        specifically lines 110-113.
    4. Execute dbt build -s stg_tpch__parts

*/
{%- test has_valid_value(model, column_name, value) %}
  select * from {{ model }}
  where {{ column_name }} = '{{ value }}'
{%- endtest %}
