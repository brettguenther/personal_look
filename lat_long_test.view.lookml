- explore: lat_long_test
- view: lat_long_test

  derived_table:
    sql: |
      SELECT CAST('-31.35399' AS DECIMAL(10,6)) as lat,
      CAST('-21.35399' AS DECIMAL(10,6)) as lon
      UNION
      SELECT CAST('11.3529' AS DECIMAL(10,6)) as lat,
      CAST('-11.35399' AS DECIMAL(10,6)) as lon

  fields:
    - dimension: loc
      type: location
      sql_latitude: ${TABLE}.lat
      sql_longitude: ${TABLE}.lon

