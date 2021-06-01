-- DROP ALL TABLES
-- For cleaning up a database before loading a dump

-- Create a table so the script won't fail on an empty database
CREATE TABLE xxx ( xxx int);

-- Initialize
SET @tables = NULL;
SET FOREIGN_KEY_CHECKS = 0;
SET GROUP_CONCAT_MAX_LEN=32768;

-- Get the table names
SELECT GROUP_CONCAT('`', table_schema, '`.`', table_name, '`') INTO @tables
FROM information_schema.tables
WHERE table_schema = (SELECT DATABASE());
SELECT IFNULL(@tables, '') INTO @tables;

-- Drop the tables
SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Finish
SET FOREIGN_KEY_CHECKS = 1;
