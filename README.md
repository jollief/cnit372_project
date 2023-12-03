# cnit372_project

-- Use the YouTube Influencer csv file to import data into Oracle SQL Developer
-- Use the Trending Dataset csv file to import into Oracle SQL Developer
-- Use the Comments csv file from YouTube Statistics dataset to import comments

-- First, open a connection to the CNIT 372 database
-- Next, right click on Tables
-- Then click import
-- Choose the file from the zip folder and follow the steps to fix any column name and data type errors
-- Then import and the data will be added to a new table


-- NOTE: Becuase the data did not match perfectly with our Milestone 1/2 questions, we had to slightly alter the questions in the SQL files.
-- We have noted the questions in each SQL file and the corresponding question from Mileston 2, howver they are slightly altered.
-- Also, questions and code are updated in the Project Report


-- Code to delete all duplicate rows from trending_data

delete from tredning_data
where rowid not in (
  select min(rowid)
  from trending_data
  group by video_id
);

-- To test if this worked
select video_id, count(*)
from trending_data
having count(*) > 1;

-- This query should return no rows

