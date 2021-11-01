-- {{ config(
--     schema='partitions'
--     ) }}


-- select * from RAW.AGGREGATOR.OPTION_VARIANTS
-- where _AIRBYTE_EMITTED_AT > (select max(_AIRBYTE_EMITTED_AT) from {{this}})

{{ config(
    schema='partitions',
    materialized='incremental'
    ) }}

select * from RAW.AGGREGATOR.OPTION_VARIANTS
{% if is_incremental() %}

  where _AIRBYTE_EMITTED_AT > (select max(_AIRBYTE_EMITTED_AT) from {{this}})

{% endif %}
