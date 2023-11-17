-- Question 10
-- Modified question to apply to data

-- What video with over 1,000,000 views has the least amount of likes, and how comments did that video have

SELECT VideoTitle, NoOfLikes, VideoViews, NoOfComments
FROM creator_data
WHERE VideoViews > 1000000
GROUP BY VideoTitle, NoOfLikes, VideoViews, NoOfComments
HAVING NoOfLikes = (SELECT MIN(NoOfLikes) FROM creator_data);

/*
VIDEOTITLE                                                                                                                        NOOFLIKES VIDEOVIEWS NOOFCOMMENTS
-------------------------------------------------------------------------------------------------------------------------------- ---------- ---------- ------------
Pokémon Journeys                                                                                                                          0    3517520            0
*/
