{% set months = {'01':'Jan', '02':'Feb', '03':'Mar', '04':'Apr', '05':'May', '06':'Jun', '07':'Jul', '08':'Aug', '09':'Sep', '10':'Oct', '11':'Nov', '12':'Dec'} %}

{% macro fmt_date(d) %}
  {%- if d -%}
    {%- if d | lower in ['present', 'current'] -%}
      Present
    {%- elif '-' in d -%}
      {%- set p = d.split('-') -%}
      {%- if p | length >= 2 and p[1] in months -%}
        {{ months[p[1]] }} {{ p[0] }}
      {%- else -%}
        {{ d }}
      {%- endif -%}
    {%- else -%}
      {{ d }}
    {%- endif -%}
  {%- endif -%}
{% endmacro %}

{% set start_str = fmt_date(entry.start_date) | trim %}
{% set end_str = fmt_date(entry.end_date) | trim %}

{% if start_str and end_str %}
  {% set date_range = start_str ~ " - " ~ end_str %}
{% elif start_str %}
  {% set date_range = start_str %}
{% elif entry.date %}
  {% set date_range = fmt_date(entry.date) | trim %}
{% else %}
  {% set date_range = "" %}
{% endif %}

#one-col-entry(
  [
    #strong[{{ entry.company }}]{% if entry.position %} | {{ entry.position }}{% endif %}{% if entry.location %} | {{ entry.location }}{% endif %}{% if date_range %} | {{ date_range }}{% endif %}

    {% if entry.highlights %}
    {% for highlight in entry.highlights %}
    - {{ highlight }}
    {% endfor %}
    {% endif %}
  ]
)