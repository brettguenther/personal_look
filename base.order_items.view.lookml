- view: order_items
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: inventory_item_id
    type: number
    # hidden: true
    sql: ${TABLE}.inventory_item_id

  - dimension: order_id
    type: number
    # hidden: true
    sql: ${TABLE}.order_id

  - dimension_group: returned
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returned_at

  - dimension: sale_price
    type: number
    sql: ${TABLE}.sale_price
    
  - measure: running_sale_total_row
    type: running_total
    sql: ${total_sale_price}
    direction: row       # Calculation across the row (default)

  - measure: running_sale_total_column
    type: running_total
    sql: ${total_sale_price}
    direction: column
    
  - measure: total_sale_price
    type: sum
    sql: ${sale_price}

  - dimension: pct_of_order_price
    type: number
    sql: |
      (SELECT sale_price/sum(x) over (partition by order_id) as part FROM order_items)

  - measure: count
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
    
  sets:
    base_set:
      - id
      - order_id
      - returned_date
      - sale_price
    team_1_set:
      - base_set*
      - pct_of_order_price
    team_2_set:
      - team_1_set*
      - inventory_item_id
