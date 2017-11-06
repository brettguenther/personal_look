include: "base.orders.view"
view: team_1_orders {
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
