connection: "thelook"

# # include all the views
include: "*.view"

include: "base_joins.base"

# # include all the dashboards
include: "team_1.*.dashboard"
include: "ext_*.dashboard"

explore: orders_team_1 {
  access_filter: {
    field: order_items.id
    user_attribute: access_level
  }
  view_name: orders
  from: orders_team_1
  extends: [orders_base]

  join: order_items {
    fields: [team_1_set*]
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }

  join: inventory_items {
    fields: []
    foreign_key: order_items.inventory_item_id
    relationship: many_to_one
  }

  join: users {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
