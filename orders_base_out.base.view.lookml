- explore: orders_base_outside
  extension: required
  view: orders
  joins:
    - join: order_items
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: one_to_many

    - join: inventory_items
      foreign_key: order_items.inventory_item_id
