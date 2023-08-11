{% macro get_new_column_name(column_name) %}

{% set relation_query %}
select NewColumnName
from {{ ref('column_mapping') }}
where columnName = {{ column_name }}
{% endset %}

{% set results = run_query(relation_query) %}

{% if execute %}
{# Return the first column #}
{% set result_value = results.columns[0].values() %}
{% else %}
{% set result_value = null %}
{% endif %}

{{ return(result_value) }}

{% endmacro %}

select {{ get_new_column_name('Zone') }}
