view: order_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: true
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: true
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: running_sale_total_row {
    type: running_total
    sql: ${total_sale_price} ;;
    # Calculation across the row (default)
    direction: "row"
  }

  measure: running_sale_total_column {
    type: running_total
    sql: ${total_sale_price} ;;
    direction: "column"
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  dimension: pct_of_order_price {
    type: number
    sql: (SELECT sale_price/sum(x) over (partition by order_id) as part FROM order_items)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  set: base_set {
    fields: [id, order_id, returned_date, sale_price]
  }

  set: team_1_set {
    fields: [base_set*, pct_of_order_price]
  }

  set: team_2_set {
    fields: [team_1_set*, inventory_item_id]
  }
}
