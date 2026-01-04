-- Creating Database and Schemas (Bronze, Silver)
CREATE DATABASE transcript_demo;
CREATE SCHEMA transcript_demo.raw;
CREATE SCHEMA transcript_demo.silver;

-- File format
CREATE OR REPLACE FILE FORMAT transcript_demo.raw.json_ff
TYPE = 'JSON';
