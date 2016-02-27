- connection: thelook

- include: "*.view.lookml"       # include all the views

- explore: orders_base_joins
  extends: orders_base

# - explore: events
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${events.user_id} = ${users.id}
#       relationship: many_to_one  
#   
# - explore: inventory_items
#   access_filter_fields: [products.department]
#   joins:
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one
# 
# 
# - explore: order_items
#   joins:
#     - join: inventory_items
#       type: left_outer
#       sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
#       relationship: many_to_one
# 
#     - join: orders
#       type: left_outer
#       sql_on: ${order_items.order_id} = ${orders.id}
#       relationship: many_to_one
# 
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one
# 
# - explore: orders
#   view: orders
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one
# 
# - explore: orders_extended
#   extends: orders
#   joins:
#     - join: users
#       from: users_extended
# 
# - explore: users_extended_test
#   extends: users
#   view: users
#   from: users_extended
# 
# 
# - explore: products
# 
# - explore: schema_migrations
# 
# - explore: user_data
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${user_data.user_id} = ${users.id}
#       relationship: many_to_one
#       
# - explore: users
#   joins:
#     - join: orders
#       type: left_outer
#       sql_on: ${users.id} = ${orders.user_id}
#       relationship: one_to_many
