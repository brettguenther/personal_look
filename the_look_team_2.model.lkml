connection: "thelook"

# include all views in this project
include: "team_2.*.view"

# include core explores
include: "base_joins.base"

# include base view files
include: "base.*.view"

# include all dashboards in this project
include: "team_2.*.dashboard"

explore: orders_team_2 {
  extends: [orders_base]

  join: order_items {
    # example of field set exposure manipulation for team 2
    fields: [team_2_set*]
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }

  join: inventory_items {
    # example of exposing more dimensions through an extended view
    from: inventory_items_with_extensions
    foreign_key: order_items.inventory_item_id
  }

  # add in a new join relationship that is specific to this team
  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
}

explore: order_items_team_2 {
  extends: [order_items_base]
}

explore: events_base_team_2 {
  extends: [events_base]
}
