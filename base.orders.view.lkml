view: orders {
  sql_table_name: demo_db.orders ;;
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [id, created_time, user_id, status]
  }
}
