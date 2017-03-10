connection: "thelook"

# # include all the views
include: "*.view"

# # include all the dashboards
include: "team_1.*.dashboard"

include: "ext_*.dashboard"

# include: "test_timezone.dashboard"

explore: orders_team_1 {
  view_name: orders
  extends: [orders_base]

  join: order_items {
    fields: [team_1_set*]
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }

  join: inventory_items {
    fields: []
    foreign_key: order_items.inventory_item_id
  }
}

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
# - explore: orders_team_1
#   view: orders
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one
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
