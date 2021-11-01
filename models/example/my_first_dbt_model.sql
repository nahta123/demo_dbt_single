{{ config(
    schema='partitions',
    materialized='incremental'
    ) }}


select * from RAW.AGGREGATOR.OPTION_VARIANTS
{% if is_incremental() %}

  where _AIRBYTE_EMITTED_AT > (select max(_AIRBYTE_EMITTED_AT) from {{this}})

{% endif %}
