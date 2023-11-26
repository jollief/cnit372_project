-- Question 1
-- How can you create a cursor to display the video_id, the amount of likes
-- and the title of the video from the trending_data table?

declare
    v_id trending_data.video_id%type;
    v_likes trending_data.likes%type;
    v_name trending_data.creatorname%type;
    cursor v_video is
        select video_id, likes, creatorname from trending_data;
begin
    open v_video;
    loop
    fetch v_video into v_id, v_likes, v_name;
        exit when v_video%notfound;
        dbms_output.put_line(v_id || ' ' || v_likes || ' ' || v_name);
    end loop;
    close v_video;
end;

/* Results
YwJyis4yOEA 20393 Carli Bybel
4OCcbUZuTUQ 359609 TREASURE (트레저)
NkE0AMGzpJY 1599289 MrBeast
JFm7YDVlqnI 1006096 DrakeVEVO
QcTwbXLMm9c 293238 charli d'amelio
dYZlrfarCIs 25720 Champions League on CBS Sports
vwnyP6979xE 11925 Champions League on CBS Sports
qDFjsMFojzs 147308 jeffreestar
ozWNPkhqi8o 93530 The Boys
7mH-ug3Dgo8 1793 CBS Sports HQ
0C80BSgjb8M 334693 YoungBoy Never Broke Again
m1t1ooj_Em0 79106 Simply Nailogical
4fSGeKU5Mvw 652 MMA Fight Nation
jWQNqlZ47Ec 40995 HSM
SCUXdRb5abU 166131 Apex Legends
FbM1yi4mMMc 1705178 MrBeast
6BEfZCH1nN8 33123 Official Ed and Lorraine Warren Channel
xE2f745DICI 956 SHOWTIME Sports
4rjNpA94ly4 8446 UFC - Ultimate Fighting Championship
b8pSdMHicYw 953 kenanK TV
0opZqh_TprM 213877 Lyrical Lemonade
YNyFAro1E5M 293549 PoloGVEVO
fqT81qdPpOw 146350 P2istheName
oBOKCRuo2y4 10696 C&C Life
_rJYc_k-w84 6818 billschannel
*/

-- Question 3
-- How can you let a user know that an action will happen automatically when running a specific command?

create or replace trigger data_trigger
    before delete on trending_data
    for each row
begin
    dbms_output.put_line('Trigger fired before deleting a row from trending_data');
end;

/* Results
Trigger DATA_TRIGGER compiled
*/

-- Testing the Trigger
delete from trending_data
where video_id = '_rJYc_k-w84';

/* Results
1 row deleted. 

Trigger fired before deleting a row from trending_data
*/

rollback;

