- explore: orders_base
  extension: required
  view: orders
  joins:
    - join: order_items
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: one_to_many
      
    - join: inventory_items
      foreign_key: order_items.inventory_item_id
      
- explore: events_base
  extension: required
  view: events
  joins:
    - join: users
      type: left_outer
      sql_on: ${events.user_id} = ${users.id}
      relationship: many_to_one  

- explore: order_items_base
  extension: required
  view: order_items
  joins:
    - join: inventory_items
      type: left_outer
      sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
      relationship: many_to_one

    - join: orders
      type: left_outer
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: many_to_one

    - join: products
      type: left_outer
      sql_on: ${inventory_items.product_id} = ${products.id}
      relationship: many_to_one

    - join: users
      type: left_outer
      sql_on: ${orders.user_id} = ${users.id}
      relationship: many_to_one