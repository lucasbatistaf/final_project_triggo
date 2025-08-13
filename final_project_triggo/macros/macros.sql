{% macro date_fixing(column_name) %}

    to_date(right(right('0' || {{column_name}}, 8), 4) || '-' || substring(right('0' || {{column_name}}, 8), 3, 2) || '-' || left(right('0' || {{column_name}}, 8), 2) )

{% endmacro %}

{% macro sex_def(column_name) %}

    case 
        when {{ column_name }} = 1 then 'M'
        when {{ column_name }} = 2 then 'F'
        else 'Ignorado'
    end

{% endmacro %}

{% macro race_def(column_name) %}

    case 
        when {{ column_name }} = 1 then 'Branca'
        when {{ column_name }} = 2 then 'Preta'
        when {{ column_name }} = 3 then 'Amarela'
        when {{ column_name }} = 4 then 'Parda'
        when {{ column_name }} = 4 then 'Indigena'
        else 'Ignorado'
    end

{% endmacro %}

{% macro education_def(column_name) %}

    case 
        when {{ column_name }} = 0 then 'Sem escolaridade'
        when {{ column_name }} = 1 then 'Fundamental I (1ª a 4ª série)'
        when {{ column_name }} = 2 then 'Fundamental II (5ª a 8ª série)'
        when {{ column_name }} = 3 then 'Médio (antigo 2º Grau)'
        when {{ column_name }} = 4 then 'Superior incompleto'
        when {{ column_name }} = 5 then 'Superior completo'
        else 'Ignorado'
    end

{% endmacro %}