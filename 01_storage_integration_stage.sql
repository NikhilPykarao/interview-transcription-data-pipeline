-- Creating the S3 Stage using Storage Integration
CREATE OR REPLACE STAGE transcript_stage
URL = 's3://transcript-de-project/transcript/'
STORAGE_INTEGRATION = s3_int
FILE_FORMAT = (TYPE = JSON);

DESC INTEGRATION S3_INT;
LIST @transcript_stage;
