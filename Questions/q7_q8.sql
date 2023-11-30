-- Question 7
-- What is the difference between a video's upload date and the date that the video trends?

create or replace procedure VideoDate as
begin
    for video_date in (
        select videotitle, publishedon, trending_date
        from trending_data)
    loop
        dbms_output.put_line('Video Title: ' || video_date.videotitle);
        dbms_output.put_line('Published On: ' || video_date.publishedon);
        dbms_output.put_line('Trending Date: ' || video_date.trending_date);
        dbms_output.put_line('-------------------------------------');
    end loop;
end;

exec videodate;

-- Question 8
-- What comment has the most likes and what was the comment?

create or replace procedure most_liked_comment is
    v_comment varchar2(1024);
    v_likes number(38,0);
begin
    select comment_text, likes 
    into v_comment, v_likes
    from comments
    order by likes desc
    fetch first row only;
    
    if v_comment is not null then
        dbms_output.put_line('Most Liked Comment: ' || v_comment);
        dbms_output.put_line('Likes: ' || v_likes);
    end if;
end;

exec most_liked_comment;



