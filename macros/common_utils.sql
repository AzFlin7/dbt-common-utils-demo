/*
This macro is used to remove whitespaces from columns
Parameters: 
@column_name: Column name to remove whitespaces
*/
{% macro trim_whitespaces(column_name) -%}
    trim({{column_name}})
{%- endmacro %}




/* ====================================================================
/               Datetime utilities macros
/* ====================================================================

/*
This macro is used to get current business effective date based on timezone
Parameters: 
@timezone - timezone value e.g. UTC, EST, default is EST
*/
{% macro get_business_effective_date(format_type='date', timezone = 'EST' ) -%}
    {% if format_type == 'date' %}
        CURRENT_DATE('{{ timezone }}' )
    {% elif format_type == 'datetime' %}
        CURRENT_DATETIME('{{ timezone }}')
    {% elif format_type == 'timestamp' %}
        CURRENT_TIMESTAMP()
    {% else %}
        CURRENT_DATE('{{ timezone }}' )
    {% endif %}
{%- endmacro %}



 -- Datetime format elements: https://cloud.google.com/bigquery/docs/reference/standard-sql/format-elements#format_elements_date_time
{% macro standardize_datetime(column_name, input_format = '%Y-%m-%d %H:%M:%S', output_format = '%Y-%m-%d %H:%M:%S') -%}
    FORMAT_DATETIME('{{output_format}}', PARSE_DATETIME('{{ input_format }}', {{ column_name }} ) )
{%- endmacro %}


/*
This macro is used to convert date formats to standardized date format
*/
{% macro standardize_date(column_name, input_format = '%Y-%m-%d', output_format = '%Y-%m-%d') -%}
    FORMAT_DATE('{{output_format}}', PARSE_DATE('{{ input_format }}', {{ column_name }} ) )
{%- endmacro %}



{% macro standardize_timestamps(column_name, input_format = '%Y-%m-%d %H:%M:%S %Z', output_format = '%Y-%m-%d %H:%M:%S %Z') -%}
    FORMAT_TIMESTAMP('{{output_format}}', PARSE_TIMESTAMP('{{ input_format }}', {{ column_name }} ) )
{%- endmacro %}



{% macro convert_timezone(column_name, target_timestamp = 'UTC' ) -%}
    DATETIME( {{column_name}}, '{{ target_timestamp }}')
{%- endmacro %}










