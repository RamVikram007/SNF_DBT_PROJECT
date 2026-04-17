{% macro trim_column(column_name, node) %}
  {{ column_name | trim | upper }}
{% endmacro %}