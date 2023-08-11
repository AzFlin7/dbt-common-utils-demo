{% test year_greater_than_2000(model, column_name) %}

    select *
    from {{ model }}
    where EXTRACT(YEAR FROM {{ column_name}} ) < 2000

{% endtest %}