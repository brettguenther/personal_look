- connection: thelook

- include: "base_joins.view.lookml"       # include all the views
- include: "base.*.view.lookml"

#extend right of the base and pull in all relationships and exposed fields
- explore: orders_base_joins
  extends: orders_base

- explore: events
  joins:
    - join: users
      type: left_outer
      sql_on: ${events.user_id} = ${users.id}
      relationship: many_to_one  

- explore: order_items
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