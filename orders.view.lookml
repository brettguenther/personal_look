- view: orders
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: status
    sql: ${TABLE}.status

  - dimension: user_id
    type: int
    # hidden: true
    sql: ${TABLE}.user_id
    
  - dimension: user_order_count
    type: int
    sql: |
      (SELECT count(*) from orders o
      WHERE o.user_id = ${TABLE}.user_id
        AND o.created_at < ${TABLE}.created_at
      )

  - measure: count
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]

