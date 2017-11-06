include: "base.orders.view"
view: orders_team_1 {
  extends: [orders]
  measure: cancelled_orders {
    type: count
    filters: {
      field: status
      value: "cancelled"
    }
  }
  measure: pending_orders {
    type: count
    filters: {
      field: status
      value: "pending"
    }
  }
  dimension: is_cancelled {
    type: yesno
    sql: ${status} = "cancelled" ;;
  }
}
