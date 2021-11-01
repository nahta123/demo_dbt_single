


select * from RAW.AGGREGATOR.OPTION_VARIANTS


  where _AIRBYTE_EMITTED_AT > (select max(_AIRBYTE_EMITTED_AT) from RAW.dbt_test_partitions.my_first_dbt_model)

