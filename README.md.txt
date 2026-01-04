# Interview Transcription Data Pipeline (AWS + Snowflake)

## 📖 Project Overview
This project demonstrates an end-to-end data engineering workflow for processing interview audio transcripts generated using a speech-to-text service (similar to AWS Transcribe).

The pipeline focuses on parsing speaker-wise interview conversations from JSON format and preparing them for analytics and reporting.

---

## ⚙️ SQL Pipeline Structure
SQL scripts are organized step-wise:
1. Storage integration and S3 stage
2. Database and schema creation
3. Bronze layer JSON ingestion
4. Silver layer transformation
5. Speaker-level and item-level normalization
6. Incremental processing using Streams and Tasks

---

## 🧩 Problem Statement
Interview audio files are transcribed into JSON format containing:
- Speaker labels
- Time segments
- Spoken content

These JSON files are not analytics-friendly and need to be transformed into structured tables.

---

## 🏗️ Architecture (Conceptual)
1. Audio file uploaded to cloud storage (Amazon S3)
2. Speech-to-text service generates transcription JSON
3. JSON stored in S3
4. Snowflake ingests JSON using external/internal stages
5. SQL used to parse and flatten transcript data
6. Structured tables created for analytics

---

## 📂 Data Description
Sample file:
- `interview_01.json`

Key fields:
- `speaker_labels`: identifies different speakers and their speaking duration
- `items`: individual spoken sentences with timestamps and speaker labels
- `transcripts`: full combined transcript text

---

## 🛠️ Technologies Used
- SQL
- Snowflake
- AWS (S3, Transcribe - conceptual)
- JSON data processing

---

## 🔍 Sample Use Cases
- Interview analytics
- Speaker-wise response evaluation
- Keyword extraction from interview answers
- Candidate screening automation

---

## 🚀 Future Enhancements
- Automate ingestion using Snowpipe
- Add Python preprocessing using AWS Lambda
- NLP analysis on candidate responses
- Dashboard using Power BI / Tableau

---

## 👤 Author
**Nikhil**  
Data Engineer | SQL | Snowflake | AWS

