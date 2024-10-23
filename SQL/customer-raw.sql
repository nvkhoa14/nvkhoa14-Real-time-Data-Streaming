// creating external stage to loading data from s3 bucket

create or replace stage manage_db.external_stages.aws_stages
    url = "s3://dw-streaming-snowflake/stream-data"
    credentials = ();

create or replace file format manage_db.external_stages.csv
    type = csv,
    field_delimiter = ","
    skip_header = 1;

desc stage manage_db.external_stages.aws_stages;

SHOW STAGES;
LIST @aws_stages;

// create snowpipe

create or replace PIPE customer_s3_pipe
    auto_ingest = true 
    AS COPY INTO customer_raw
      FROM @aws_stages
      FILE_FORMAT = CSV;
      
show pipes;
select SYSTEM$PIPE_STATUS('customer_s3_pipe');

select * from customer_raw;

TRUNCATE  customer_raw;