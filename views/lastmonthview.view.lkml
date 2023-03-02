# The name of this view in Looker is "Lastmonthview"
view: lastmonthview {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlgcp2.billing_dashboard_views.lastmonthview`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: billmonth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.billmonth ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Projectcost" in Explore.

  dimension: projectcost {
    type: string
    sql: ${TABLE}.projectcost ;;
  }

  dimension: projectname {
    type: string
    sql: ${TABLE}.projectname ;;
  }

  measure: count {
    type: count
    drill_fields: [projectname]
  }
}
