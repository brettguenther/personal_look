- dashboard: test_timezone
  title: Test Timezone
  layout: tile
  tile_size: 100

  elements:

  - name: add_a_unique_name_1465406532639
    title: Untitled Table
    type: table
    model: the_look_team_2
    explore: orders_team_2
    dimensions: [orders.created_date, orders.created_time]
    measures: [orders.count]
    filters:
      orders.created_date: 2016/06/07
    sorts: [orders.created_date desc]
    limit: 500
    column_limit: 50
    #query_timezone: America/Los_Angeles


