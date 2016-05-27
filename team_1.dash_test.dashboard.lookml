- dashboard: dash_test
  title: Dash Test
  layout: tile
  tile_size: 100

  filters:
  - name: test
    title: 'Filter Test'
    type: number_filter
    explore: orders_team_1
    field: inventory_items.cost
    default_value: '>50'

  elements:

  - name: new tile
    title: Untitled Visualization
    type: single_value
    model: the_look_team_1
    explore: orders_team_1
    measures: [orders.count]
    filters:
      inventory_items.cost: '>50'
    sorts: [orders.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_single_value_title: true
    show_comparison: false
