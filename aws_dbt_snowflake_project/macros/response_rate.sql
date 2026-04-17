{% macro response_rate(column_name) %}
  case 
    when {{ column_name }} > 95 then 'very good'
    when {{ column_name }} > 80 then 'good'
    when {{ column_name }} > 60 then 'fair'
    else 'poor'
  end
{% endmacro %}