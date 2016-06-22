- dashboard: test_timezone
  title: Test Timezone
  layout: tile
  tile_size: 100

  elements:

  - name: no_query_timezone
    title: No TZ Param LA
    type: table
    model: the_look_team_1
    explore: orders_team_1
    dimensions: [orders.created_time]
    measures: [orders.count]
    sorts: [orders.created_time desc]
    limit: 500
    #query_timezone: America/Los_Angeles
    
  - name: query_timezone
    title: TZ Param
    type: table
    model: the_look_team_1
    explore: orders_team_1
    dimensions: [orders.created_time]
    measures: [orders.count]
    sorts: [orders.created_time desc]
    limit: 500
    query_timezone: America/Los_Angeles

  - name: no_query_timezone_ny
    title: No TZ Param NY
    type: table
    model: the_look_team_1
    explore: orders_team_1
    dimensions: [orders.created_time]
    measures: [orders.count]
    sorts: [orders.created_time desc]
    limit: 500
    #query_timezone: America/New_York


