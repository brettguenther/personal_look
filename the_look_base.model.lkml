connection: "thelook"


# include all the views
include: "base_joins.view"

include: "base.*.view"

#extend right of the base and pull in all relationships and exposed fields
explore: orders_base_joins {
  extends: [orders_base]
}

explore: order_items_base_joins {
  extends: [order_items_base]
}

explore: events_base_joins {
  extends: [events_base]
}
