-- Question 10
-- What video with over 1 million views has the least amount of likes, and how many comments did the video have?

create or replace procedure one_million
    (least_liked_video out varchar2) as
begin
    select videotitle into least_liked_video
    from (
        select videotitle, likes, videoviews, comment_count
        from creator_data
        where videoviews > 1000000
        group by videotitle, likes, videoviews, comment_count
        having likes = (select min(likes) from creator_data)
    )
    where rownum = 1;
end;

declare 
    least_liked_video varchar2(128);
begin
    one_million(least_liked_video);
    dbms_output.put_line('The video that has over 1,000,000 views and the least amount of likes is: ' || least_liked_video);
end;