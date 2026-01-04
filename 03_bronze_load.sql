-- Bronze table (raw JSON ingestion)
CREATE OR REPLACE TABLE transcript_demo.raw.transcripts_bronze (
    raw_data VARIANT,
    file_name STRING,
    load_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Load JSON from S3 into Bronze
COPY INTO transcript_demo.raw.transcripts_bronze
FROM (
    SELECT
        $1,
        METADATA$FILENAME,
        CURRENT_TIMESTAMP
    FROM @transcript_demo.raw.transcript_stage
)
FILE_FORMAT = transcript_demo.raw.json_ff;

-- Validation
SELECT
    file_name,
    raw_data:jobName::STRING AS job_name,
    load_time
FROM transcript_demo.raw.transcripts_bronze
ORDER BY load_time;
