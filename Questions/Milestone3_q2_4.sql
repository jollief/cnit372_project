CREATE TABLE YoutubeAnalysis (
    VideoLink VARCHAR2(500),
    VideoViews NUMBER,
    VideoTitle VARCHAR2(250),
    ChannelURL VARCHAR2(250),
    CreatorName VARCHAR2(50),
    CreatorGender VARCHAR2(10),
    TotalChannelSubcribers NUMBER,
    TotalChanelViews NUMBER,
    DurationofVideo VARCHAR2(50),
    DurationinSeconds NUMBER,
    DateofVideoUpload DATE,
    NoofLikes NUMBER,
    LanguageoftheVideo VARCHAR2(50),
    Subtitle VARCHAR2(5),
    VideoDescription VARCHAR2(5),
    Hashtags NUMBER,
    NoofComments NUMBER,
    DateoftheLastComment DATE,
    MaximumQualityoftheVideo NUMBER,
    NoofVideostheChannel NUMBER,
    NoofPlaylist NUMBER,
    PremieredorNot VARCHAR2(5),
    CommunityEngagement NUMBER,
    Intern VARCHAR2(50)
);

-- Q2. What language is used most?
SELECT LanguageoftheVideo, COUNT(*) AS LanguageCount
FROM YoutubeAnalysis
GROUP BY LanguageoftheVideo
ORDER BY LanguageCount DESC;

-- Result
/*
LANGUAGEOFTHEVIDEO  LANGUAGECOUNT
---------------------------------
English	421
Hindi	130
Tamil	40
Telugu	30
Kannada	21
N/A	19
Malayalam	13
Sanskrit	5
Urdu	3
Japenese	3
Hindi/English	3
English + Hindi	2
Nawayathi	2
Konkani	2
Punjabi	1
Urdu + Arabic	1
Mongalian	1
Arabic	1
*/

-- Modified a question to include the data
-- Q4. Do more than 3 hashtags bring more subscribers than average?
WITH AverageSubscribers AS (
    SELECT AVG(TotalChannelSubcribers) AS AvgSubscribers
    FROM YoutubeAnalysis
)

SELECT
    CreatorName,
    Hashtags,
    TotalChannelSubcribers,
    CASE
        WHEN y.TotalChannelSubcribers > x.AvgSubscribers THEN 'Above Average'
        ELSE 'Below or Equal Average'
    END AS SubscriberComparison
FROM YoutubeAnalysis y
CROSS JOIN AverageSubscribers x
WHERE y.Hashtags > 3;

-- Result
/*
CREATORNAME HASHTAGS TOTALCHANNELSUBSCRIBERS SUBSCRIBERCOMPARISON
------------------------------------------------------------------
Etl Qa Labs	4	7800	Below or Equal Average
100 Years Of Health	7	25500	Below or Equal Average
World Of Hemant	11	34	Below or Equal Average
Yidircars	6	551000	Below or Equal Average
Watchgecko	4	43500	Below or Equal Average
Vidyut Jammwal	6	1370000	Below or Equal Average
Namanh Kapur	5	105000	Below or Equal Average
Entertainment Live	6	15600	Below or Equal Average
Dji Tutorials	4	421000	Below or Equal Average
Ganesh Prasad	5	2250000	Below or Equal Average
Great Learning	4	694000	Below or Equal Average
Ganesh Prasad	5	2250000	Below or Equal Average
NBC News	4	7060000	Below or Equal Average
Thu Vu Data Analytics	6	52600	Below or Equal Average
Ganesh Prasad	4	2250000	Below or Equal Average
Dr Vivek Bindra	10	19800000	Above Average
Ganesh Prasad	8	2250000	Below or Equal Average
Ganesh Prasad	9	2250000	Below or Equal Average
Ganesh Prasad	5	2250000	Below or Equal Average
Ganesh Prasad	5	2250000	Below or Equal Average
Chef Ranveer	10	538000	Below or Equal Average
Luke Barouse	4	243000	Below or Equal Average
*/