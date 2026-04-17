{% macro tag(column_name) %}
  case 
    when {{ column_name }} < 100 then 'low'
    when {{ column_name }} < 200 then 'Medium'
    else 'high'
  end
{% endmacro %}