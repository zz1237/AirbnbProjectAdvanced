{# this is model level test, not column level test #}

{% test min_row_count(model, min_row_cnt)%}
{{
  config(
    severity = 'warn'
    )
}}
select
    count(*) as cnt
from {{model}}
having count(*) < {{min_row_cnt}}
{% endtest %}