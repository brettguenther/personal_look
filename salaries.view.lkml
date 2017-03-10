explore: salaries {
  sql_preamble: SET group_concat_max_len = 100000; ;;
}
view: salaries {
  derived_table: {
      sql: SELECT 1 as id,
              'Joan of Arc' as name,
              'Executive' as position,
              2015 as hired_year,
              28000 as salary
              UNION
              SELECT  2 as id,
              'Winston Churchil' as name,
              'Executive' as position,
              2006 as hired_year,
              29000 as salary
               ;;
    }
  measure: count {
    type: count
    drill_fields: [name,position,hired_year,salary]
  }

  dimension:  id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: hired_year {
    type: number
    sql: ${TABLE}.hired_year ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}.salary ;;
  }

}
