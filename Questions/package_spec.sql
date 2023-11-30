create or replace package video_package as
    procedure LanguageCount(most_used_language out varchar2);
    procedure one_million(least_liked_video out varchar2);
    procedure most_liked_comment;
    procedure videodate;
end video_package;

create or replace package body video_package as
    procedure LanguageCount
        (most_used_language out varchar2) as
    begin
        select language into most_used_language
        from (
            select language, count(*) as language_count
            from creator_data
            group by language
            order by language_count desc
        )
        where rownum = 1;
    end;

    procedure one_million
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

    procedure most_liked_comment is
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
    
    procedure VideoDate as
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
end video_package;