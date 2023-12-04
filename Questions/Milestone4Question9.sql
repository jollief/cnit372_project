-- Question 9
-- Modified question to apply data

-- Create a procedure that lists the creator name, total channel views, and the total channel subscribers for the channels with the most amount of weekly posts

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE MaxMinWeeklyPosts
AS 
PostOutput VARCHAR2(38);
CreatorOutput VARCHAR2(1280);
ViewOutput NUMBER(38);
SubscriberOutput NUMBER(38);

BEGIN

SELECT PostsPerWeek, CreatorName, TotalChannelViews, TotalChannelSubscribers
    into PostOutput, CreatorOutput, ViewOutput, SubscriberOutput
FROM CREATOR_DATA
WHERE PostsPerWeek = (SELECT MAX(PostsPerWeek) FROM CREATOR_DATA)
ORDER BY TotalChannelViews DESC, TotalChannelSubscribers DESC;

/*DBMS_OUTPUT.PUT_LINE('Weekly Posts: ' + PostOutput); 
DBMS_OUTPUT.PUT_LINE('Creator Name: ' + CreatorOutput); 
DBMS_OUTPUT.PUT_LINE('Channel Views: ' + ViewOutput);
DBMS_OUTPUT.PUT_LINE('Channel Subscribers: ' + SubscriberOutput);*/

DBMS_OUTPUT.PUT('Weekly Posts: ');
DBMS_OUTPUT.PUT_LINE(PostOutput);
DBMS_OUTPUT.PUT('Creator Name: ');
DBMS_OUTPUT.PUT_LINE(CreatorOutput); 
DBMS_OUTPUT.PUT('Channel Views: ');
DBMS_OUTPUT.PUT_LINE(ViewOutput);
DBMS_OUTPUT.PUT('Channel Subscribers: ');
DBMS_OUTPUT.PUT_LINE(SubscriberOutput);

END;

BEGIN
    MaxMinWeeklyPosts;
END;

/*
Weekly Posts: 69
Creator Name: Simplilearn
Channel Views: 246600359
Channel Subscribers: 20400000
*/