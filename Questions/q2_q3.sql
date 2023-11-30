-- Question 2. 
-- What language is used the most out of all videos?

create or replace procedure LanguageCount
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

declare
    most_used_language varchar2(50);
begin
    LanguageCount(most_used_language);
    dbms_output.put_line('The most used language is: ' || most_used_language);
end;

create or replace trigger comment_trigger
    before delete on comments
    for each row
begin
    dbms_output.put_line('Trigger fired before deleting a row from COMMENTS');
end;

delete from comments
where comment_id = 1;

rollback;
