-- Question 9
-- Modified question to apply data

-- Create a procedure that lists video title, the number of views, the amount of likes, and the amount of comments for all channels with over 100,000 likes

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PopularEngagement

AS

c_title CREATOR_DATA.VideoTitle%type;
c_views CREATOR_DATA.VideoViews%type;
c_likes CREATOR_DATA.NoOfLikes%type;
c_comments CREATOR_DATA.NoOfComments%type;

CURSOR c_popularengagement IS
    SELECT  VideoTitle, VideoViews, NoOfLikes, NoOfComments
    FROM CREATOR_DATA
    WHERE NoOfLikes > 1000000
    ORDER BY NoOfLikes DESC;

BEGIN

    OPEN c_popularengagement;
    LOOP
    FETCH c_popularengagement into c_title, c_views, c_likes, c_comments;
        EXIT WHEN c_popularengagement%notfound;
        DBMS_OUTPUT.PUT_LINE(c_title || ' ' || c_views || ' ' || c_likes || ' ' || c_comments);
    END LOOP;
    CLOSE c_popularengagement;
END;


BEGIN
    PopularEngagement;
END;

/*
Ed Sheeran - Perfect 3278291072 18000000 476983
World’s Most Dangerous Escape Room! 138831703 4000000 144901
Coke Studio Season 8| Tajdar-e-Haram| Atif Aslam 408785205 3300000 197501
Alone (Official Music Video) 2317708089 2300000 1000000
Fabiolous Escape 2 153649156 2100000 33768
I Attended Spider-Man : No Way Home Premiere | Ashish Chanchlani | LA vlog 21175732 2000000 49215
Camila Cabello - Bam Bam (Official Music Video) ft. Ed Sheeran 124158710 1700000 36550
School PTM 36559485 1600000 40241
Taylor Swift ft. Chris Stapleton - I Bet You Think About Me (Taylor's Version) 45332993 1500000 46497
Ava Max - Who's Laughing Now 141644942 1300000 39000
Childhood Dreams | Aakash Gupta | Stand-up Comedy | Crowd Work 28494371 1200000 12192
I opened free 5 star hotels for poor 11234302 1100000 78759
*/