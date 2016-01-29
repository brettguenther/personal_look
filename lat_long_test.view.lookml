- view: lat_long_test

# # Specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.lat_long_test
#
# # Or, you could make this view a derived table, like this:
  derived_table:
    sql: |
      SELECT CAST('-31.35399' AS DECIMAL(10,6)) as lat,
      CAST('-21.35399' AS DECIMAL(10,6)) as lon
      UNION
      SELECT CAST('11.3529' AS DECIMAL(10,6)) as lat,
      CAST('-11.35399' AS DECIMAL(10,6)) as lon

  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: profit
#       type: number
#       sql: ${TABLE}.profit
#
#     - measure: total_profit
#       type: sum
#       sql: ${profit}
