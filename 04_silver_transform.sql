-- Silver table (cleaned, structured transcript)
CREATE OR REPLACE TABLE transcript_demo.raw.transcripts_silver AS
SELECT
    raw_data:jobName::STRING                              AS job_name,
    raw_data:status::STRING                               AS status,
    raw_data:results:speaker_labels:speakers::NUMBER     AS speaker_count,
    raw_data:results:transcripts[0]:transcript::STRING   AS full_transcript,
    file_name,
    load_time
FROM transcript_demo.raw.transcripts_bronze;

SELECT * 
FROM transcript_demo.raw.transcripts_silver;
