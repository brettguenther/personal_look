include: "base.inventory_items.view.lkml"
view: inventory_items_with_extensions {
  extends: [inventory_items]

  dimension: cost_tiers {
    type: tier
    style: integer
    tiers: [10, 20, 30, 50, 70]
    sql: ${cost} ;;
  }

  set: detail {
    fields: [base_set*, cost_tiers]
  }
}

# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: lifetime_orders
#       type: number
#       sql: ${TABLE}.lifetime_orders
#
#     - dimension: most_recent_purchase
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.most_recent_purchase_at
#
#     - measure: total_lifetime_orders
#       type: sum
#       sql: ${lifetime_orders}
