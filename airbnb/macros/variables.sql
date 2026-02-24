{% macro try_variables() %}
    {% set your_name_jinja = 'RZ'%}
    {{ log("Hello " ~ your_name_jinja, info=True)}}    

    {# log("hello dbt user " ~ var("user_name", "No username is passed")~ "!", info=True) #}
    {{ log("hello dbt user " ~ var("user_name")~ "!", info=True) }}
{% endmacro %}