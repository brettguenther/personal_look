- connection: thelook

- include: "team_2.*.view.lookml"       # include all views in this project
- include: "*.view.lookml"
- include: "team_2.*.dashboard.lookml"  # include all dashboards in this project
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

- explore: orders_team_2
  extends: orders_base
  joins:
    - join: order_items
      fields: [team_2_set*]
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: one_to_many
      
    - join: inventory_items
      from: inventory_items_with_extensions
      foreign_key: order_items.inventory_item_id

    - join: products
      foreign_key: inventory_items.product_id
