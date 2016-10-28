view: orders {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
    #X# Invalid LookML inside "dimension": {"actions":[{"label":"Label as bug","url":"https://young-falls-48413.herokuapp.com/github_issue?label=bug&issue_number={{ value }}"}]}
  }

  dimension: user_id {
    type: number
    # hidden: true
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_order_count {
    type: number
    sql: (SELECT count(*) from orders o
      WHERE o.user_id = ${TABLE}.user_id
        AND o.created_at < ${TABLE}.created_at
      )
       ;;
  }

  dimension: first_purchase {
    type: yesno
    sql: ${user_order_count} > 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }

  measure: sum_users {
    type: sum
    sql: ${user_id} ;;
  }
}
