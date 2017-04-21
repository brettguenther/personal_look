view: products {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number value_format_name: id
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: number value_format_name: id
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
