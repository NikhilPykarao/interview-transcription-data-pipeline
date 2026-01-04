-- Speaker-level table
CREATE OR REPLACE TABLE transcript_demo.raw.transcripts_speakers_silver AS
SELECT
    b.raw_data:jobName::STRING     AS job_name,
    s.value:speaker_label::STRING AS speaker_label,
    s.value:start_time::FLOAT     AS start_time,
    s.value:end_time::FLOAT       AS end_time,
    b.file_name,
    b.load_time
FROM transcript_demo.raw.transcripts_bronze b,
     LATERAL FLATTEN(
         input => b.raw_data:results:speaker_labels:segments
     ) s;

-- Item-level table
CREATE OR REPLACE TABLE transcript_demo.raw.transcripts_items_silver AS
SELECT
    b.raw_data:jobName::STRING               AS job_name,
    i.value:speaker_label::STRING           AS speaker_label,
    i.value:start_time::FLOAT               AS start_time,
    i.value:end_time::FLOAT                 AS end_time,
    i.value:alternatives[0]:content::STRING AS content,
    b.file_name,
    b.load_time
FROM transcript_demo.raw.transcripts_bronze b,
     LATERAL FLATTEN(
         input => b.raw_data:results:items
     ) i;
