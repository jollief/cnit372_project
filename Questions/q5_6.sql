create or replace procedure duration as
begin
    for dur in (
        select avg(duration_sec) as avg_in_sec, videoviews
        from creator_data
        group by videoviews
        order by videoviews)
    loop
        dbms_output.put_line('Average Duration In Seconds: ' || dur.avg_in_sec);
        dbms_output.put_line('Views: ' || dur.videoviews);
        dbms_output.put_line('-------------------------------------');
    end loop;
end;

exec duration;

create or replace procedure title as
begin
    for v_title in (
        select videoviews, likes, videotitle
        from creator_data
        where length(videotitle) > 30
        order by likes)
    loop
        dbms_output.put_line('Video Title: ' || v_title.videotitle);
        dbms_output.put_line('Views: ' || v_title.videoviews);
        dbms_output.put_line('Likes: ' || v_title.likes);
        dbms_output.put_line('-------------------------------------');
    end loop;
end;

exec most_liked_comment;