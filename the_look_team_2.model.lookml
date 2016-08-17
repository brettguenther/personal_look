- connection: thelook

- include: "team_2.*.view.lookml"       # include all views in this project
- include: "base_joins.view.lookml"
- include: "base.*.view.lookml"
- include: "team_2.*.dashboard.lookml"  # include all dashboards in this project
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

- explore: orders_team_2
  extends: orders_base
  joins:
    - join: order_items
      fields: [team_2_set*] # example of field set exposure manipulation for team 2
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: one_to_many
      
    - join: inventory_items
      from: inventory_items_with_extensions  # example of exposing more dimensions through an extended view
      foreign_key: order_items.inventory_item_id

    - join: products # add in a new join relationship that is specific to this team
      foreign_key: inventory_items.product_id
      
- explore: order_items_base_joins
  extends: order_items_base
  
- explore: events_base_joins
  extends: events_base
