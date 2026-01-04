-- Stream on Bronze table
CREATE OR REPLACE STREAM transcript_demo.raw.transcripts_bronze_stream
ON TABLE transcript_demo.raw.transcripts_bronze;

-- Incremental Silver table
CREATE TABLE IF NOT EXISTS transcript_demo.raw.transcripts_silver_inc (
    job_name STRING,
    status STRING,
    speaker_count NUMBER,
    full_transcript STRING,
    file_name STRING,
    load_time TIMESTAMP
);

-- Task for incremental processing
CREATE OR REPLACE TASK transcript_demo.raw.task_transcripts_silver
WAREHOUSE = COMPUTE_WH
SCHEDULE = '5 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('transcript_demo.raw.transcripts_bronze_stream')
AS
INSERT INTO transcript_demo.raw.transcripts_silver_inc
SELECT
    raw_data:jobName::STRING,
    raw_data:status::STRING,
    raw_data:results:speaker_labels:speakers::NUMBER,
    raw_data:results:transcripts[0]:transcript::STRING,
    file_name,
    load_time
FROM transcript_demo.raw.transcripts_bronze_stream;

ALTER TASK transcript_demo.raw.task_transcripts_silver RESUME;
