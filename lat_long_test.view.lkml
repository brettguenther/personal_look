explore: lat_long_test {}

view: lat_long_test {
  derived_table: {
    sql: SELECT 1 as id,
      CAST('-31.35399' AS DECIMAL(10,6)) as lat,
      CAST('-21.35399' AS DECIMAL(10,6)) as lon,
      'New York' as msa_name,
      4600 as msa
      UNION
      SELECT 2 as id,
      CAST('11.3529' AS DECIMAL(10,6)) as lat,
      CAST('-11.35399' AS DECIMAL(10,6)) as lon,
      'Newark' as msa_name,
      5640 as msa
       ;;
  }

  dimension: loc {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lon ;;
  }

  dimension: msa_name {
    type: string
    sql: ${TABLE}.msa_name ;;
  }

  dimension: msa {
    type: string
    sql: ${TABLE}.msa ;;
  }

  measure: loc_count {
    type: count_distinct
    sql: ${TABLE}.msa ;;
  }
}
