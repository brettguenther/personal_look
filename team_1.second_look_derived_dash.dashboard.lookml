- dashboard: second_look_derived_dash
  title: Team 1 Look Derived Dash
  layout: tile
  tile_size: 100
  show_applied_filters: true
  auto_run: true
#  filters:

  elements:

  - name: add_a_unique_name_1446509612780
    title: Order Count By Age
    type: looker_column
    model: the_look
    explore: orders
    dimensions: [users.age_tier]
    measures: [orders.count]
    sorts: [users.age_tier]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
