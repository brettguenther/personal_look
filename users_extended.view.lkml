include: "base.users.view.lkml"
view: users_extended {
  extends: [users]

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: over_30 {
    type: yesno
    sql: ${age} > 30 ;;
  }
}
