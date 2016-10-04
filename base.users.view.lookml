- view: users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: age
    type: number
    sql: ${TABLE}.age
    
  - dimension: age_tier
    type: tier
    sql: ${age}
    tiers: [20,35,50,65,80]

  - dimension: city
    sql: ${TABLE}.city

  - dimension: country
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: email
    sql: ${TABLE}.email

  - dimension: first_name
    sql: ${TABLE}.first_name

  - dimension: gender
    sql: ${TABLE}.gender

  - dimension: last_name
    sql: ${TABLE}.last_name
    
  - dimension: full_name
    sql: CONCAT(${first_name},' ',${last_name})
    html: |
      <p>{{ rendered_value }}</p>
      
  - dimension: full_name_upper
    sql: CONCAT(${first_name},' ',${last_name})
    html: |
      <p>{{ rendered_value | upcase }}</p>
      
  - dimension: full_name_test_with_escape
    sql: CONCAT(${first_name},' \, ',${last_name})
    html: |
      <p>{{ value | escape }}</p>

  - dimension: state
    sql: ${TABLE}.state

  - dimension: zip
    type: number
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - last_name
    - first_name
    - events.count
    - orders.count
    - user_data.count