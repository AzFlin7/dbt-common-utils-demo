{% macro get_prev_date() %}

  {% set today = modules.datetime.date.today() %}
  {% set one_day = modules.datetime.timedelta(days=1) %}
  {% set yesterday = (today - one_day) %}
  
  {{ return(yesterday.strftime("%Y%m%d")) }}

{% endmacro %}