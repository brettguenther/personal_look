- view: order_items
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: inventory_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.inventory_item_id

  - dimension: order_id
    type: int
    # hidden: true
    sql: ${TABLE}.order_id

  - dimension_group: returned
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returned_at

  - dimension: sale_price
    type: number
    sql: ${TABLE}.sale_price

  - dimension: pct_of_order_price
    type: number
    sql: |
      (SELECT sale_price/sum(x) over (partition by order_id) as part FROM order_items)

  - measure: count
    type: count
    drill_fields: [id, inventory_items.id, orders.id]

