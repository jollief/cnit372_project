-- CNIT 372 Milestone 3

-- Answering a few questions
-- Had to modify questions to match the dataset that was imported

-- Question 5
-- What is the average length of a video (minutes and seconds) and how does that effect views on a video?

select avg(duration_sec) as avg_in_sec, videoviews
from creator_data
group by videoviews
order by videoviews;

/* Results
AVG_IN_SEC VIDEOVIEWS
---------- ----------
        79        100
       900        661
       177        766
       492        878
      1388       1200
       652       1451
       707       5052
       522       9954
        66       9965
       299      12288
        86      22966

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       535      24399
       351      25052
        40      49244
      3923      62367
       568      68333
      1742      68789
       958      71798
        72      76310
        70      99876
       508     115636
       948     130960

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       671     143581
      1841     146059
       862     149444
       544     169135
       864     231969
       488     235881
       361     257334
       787     259396
        25     273883
       814     291111
       509     295899

AVG_IN_SEC VIDEOVIEWS
---------- ----------
      2047     369794
      1440     371268
       295     445718
       651     455523
       593     536737
       309     544628
      1017     626871
      1055     696197
      1429     745314
      1475     909640
       456    1049688

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       603    1118970
       906    1197091
       480    1214860
       375    1250286
       832    1303498
       498    1332084
       541    1342429
       460    1345202
       289    1446324
      2546    1462380
       310    1737713

AVG_IN_SEC VIDEOVIEWS
---------- ----------
      1215    1770573
       687    2108733
      1204    2140193
      7867    2329284
      1174    2443779
       129    2482051
       500    2801403
       199    2858740
       256    3014644
      1837    3346789
      1278    3517520

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       706    3527393
       248    3556375
       608    3762579
       234    3809666
       536    3810057
       751    4102167
      1074    4238915
       390    4537582
       996    5346171
       583    5599742
       546    6349738

AVG_IN_SEC VIDEOVIEWS
---------- ----------
        86    6459290
      1544    7728343
       274    7911431
      1232    7912055
        44    8408040
       808    8551935
       152    8830286
       858    8843877
       448    8883607
       873    9855561
       415   10370723

AVG_IN_SEC VIDEOVIEWS
---------- ----------
      1758   11034838
      1189   11234302
       290   12616324
       249   14687493
      2103   17476468
      1063   21175732
       256   21274487
       248   23094616
       406   25799360
       527   28494371
       861   36559485

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       460   39780561
       375   45332993
        64   49193397
       872   50176015
       416   56385391
       119   56550661
       216   65010839
       182   94029821
       256  124158710
       480  138831703
       196  141644942

AVG_IN_SEC VIDEOVIEWS
---------- ----------
       593  151671688
       600  153649156
       627  408785205
       199 2317708089
       279 3278291072

115 rows selected. 
*/

-- Question 6
-- What is the relationship between channel views and likes on a video with titles that are longer than most?

select videoviews, no_of_likes, videotitle
from creator_data
where length(videotitle) > 30
order by no_of_likes;

/* Results
VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
       661           0 ??????? ?? ??? ?? ??? ?? ???? ?? gye????                                                                                        
       100           6 Unnoticable things when Storing information in Excel | YourExcelGuy                                                             
       766          13 Byjus | Difference Inside vs Direct vs Centre Sale | BDA sale department 2022 #bda #byjus                                       
      1200          25 Dreams Rush | Ayush Shrivastava                                                                                                 
      9965         188 Top countries with proven natural gas reserves                                                                                  
     12288         369 Are Stress & Worry Hurting Your Sleep? Here's How to Get More Sleep                                                             
    169135         688 This Is Why Red Bull Keeps Winning Races                                                                                        
     62367         771 DISCIPLINE YOUR BRAIN | Wake Up Positive | Morning Motivational Speeches                                                        
       878         858 Customer Psychology, Four Views Of Consumer Decision Making                                                                     
     22966         911 Celebrating 120 Years of Excellence | Triumph Motorcycles                                                                       
     76310        1100 Tableau Projects For Practice With Examples                                                                                     

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
     24399        1100  Our Banking System is Broken ??                                                                                                
     25052        1400 The BEST Mockups You Will Find Online!                                                                                          
     68333        1900 5 Advanced Tips on how to use IF formula in Excel that will SURPRISE you                                                        
    130960        2500 1958 Jeep Willys CJ3B - The First Ever SUV                                                                                      
     68789        2600 Volkswagen Polo All Variants | Gone But Not Forgotten                                                                           
    115636        2600 SUNDAY ATROCITIES | FITNESS INFLUENCER’S LIFE ???????                                                                           
   2858740        3100 Cars on the Road - Cast - TRUCKS                                                                                                
     71798        3500 Barbell "Biryani" Meal Plan || High Protein tasty biryani                                                                       
     99876        4700 Solus GT: Performance at the intersection of fantasy and reality                                                                
    149444        4800 Anatomy of a Magazine Layout Part 1 - 15 Terms and Definitions                                                                  
    146059        6700 Samse - Didupe Off-road Royal Enfield Himalayan                                                                                 

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
    259396        6800 Motorola Edge 30 Fusion Overview                                                                                                
    745314        6800 Ultimate Knockouts: Heavyweight KOs | Full Episode | UFC Celebrates Black History Month                                         
    445718        7700 Police Officers Find Out - What is JIHAD?                                                                                       
   1446324        9500 Sang-e-Mar Mar | OST by Rahat Fateh Ali Khan | HUM Music                                                                        
    626871        9900 Dance & Celebration | Laddu Auction and Nimajjan                                                                                
   1250286       12000 Hands-on: DJI’s FPV is so immersive you’ll feel like you’re flying at nearly 90mph                                              
    291111       13000 Top Courses to Become a Data Analyst                                                                                            
    536737       13000 Why Israel’s Doomsday Nationalists Want To Destroy This                                                                         
   1303498       16000 Attack the Pressure points in human body! Tamotsu Miyahira's Kung-fu.                                                           
    455523       17000 The Four Confidences by Ed Latimore                                                                                             
   1342429       20000 How Power Query Will Change the Way You Use Excel                                                                               

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
    371268       20000 Dar es salaam to kilimanjaro flight                                                                                             
   2140193       21000 Why You Should Skip the iPhone 14...                                                                                            
   1345202       22000 Call of Duty Modern Warfare 2: Official Gameplay Trailer | Summer Game Fest 2022                                                
   2482051       24000 My favorite author’s most accessible book to date                                                                               
   2108733       25000 Top 10 FASTEST CARS In The World 2022                                                                                           
    273883       26000 Alan Walker 'Origins EP' Out Now!                                                                                               
   3527393       28000 The True Cost Of Killer Drones | True Cost | Business Insider                                                                   
    696197       29000 5 Creative Layout Techniques with InDesign and Photoshop                                                                        
   1049688       31000 How This Humanoid Robot Was Made                                                                                                
    909640       34000 Mercedes-Benz GLS 400D 4MATIC Review || In Telugu ||                                                                            
   1118970       39000 Types Of First Dates | Niharika Nm                                                                                              

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
   2329284       39000 C Programming For Beginners | Learn C Programming | C Tutorial For Beginners | Edureka                                          
   1332084       42000 Dr. Anna Lembke: "Your behavior will reset 100%"                                                                                
   3346789       43000 How to build Dynamic & Interactive Dashboard in EXCEL with Pivot Tables&Charts | Tutorial Episode #1                            
   1197091       54000 Baap Baap Hota Hai | Baap Ki Shaadi                                                                                             
   2801403       55000 Ryan Reynold’s Speech Will Leave You SPEECHLESS — Best Life Advice                                                             
   5599742       70000 ROUNDER GLUTES: 5 Mistakes Keeping Your Butt Flat                                                                               
   3809666       87000 ?GMV? Tribute to Ghost "SIMON RILEY" - Legends Never Die - Modern Warfare                                                       
   2443779       89000 Washing Machine | My Village Show Comedy                                                                                        
   3014644       92000 Michael Jackson - Beat it @ghetto.spider                                                                                        
  17476468       98000 25 Greatest Natural Wonders of the World - Travel Video                                                                         
  12616324      105000 Batman: Arkham Origins Official Trailer                                                                                         

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
   8843877      107000 HOGWARTS LEGACY New Gameplay Demo 14 Minutes 4K                                                                                 
   5346171      111000 Inside One of The Largest PRIVATE JETS in The World                                                                             
   7728343      131000 Why Finland And Denmark Are Happier Than The U.S.                                                                               
   4102167      136000 TAOISM | The Power of Letting Go                                                                                                
   4238915      166000 How do SSDs Work? | How does your Smartphone store data?                                                                        
   3762579      176000 Classroom Sothanaigal 3 | Micset                                                                                                
   6459290      186000 Marvel Studios’ Special Presentation: Werewolf By Night                                                                         
  21274487      196000 Sugino Sensei 10th Dan Master of Katori Shinto Ryu                                                                              
   3810057      196000 iPhone 14 Pro Max Unboxing & First Look - The Dynamic Island Magic                                                              
   8551935      217000 Do 100 PUSH UPS A Day | Life Changing                                                                                           
   6349738      223000 Every Outfit Hailey Bieber Wears in a Week                                                                                      

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
   8408040      227000 Marvel's Wolverine - Reveal Trailer | PlayStation Showcase 2021                                                                 
   8830286      236000 PUBG - Season 4 Gameplay Trailer                                                                                                
   9855561      239000 How a 13 year old changed 'Impossible' to 'I'm Possible'                                                                        
  49193397      288000 CLASHIVERSARY is Almost Here! RIP Barbarian?                                                                                    
   7912055      345000 Biggest Mystery in Aviation | What happened to MH370 Flight?                                                                    
   8883607      434000 Security Check - Standup Comedy                                                                                                 
      9954      556000 Talasi Abbi Falls | Hidden Waterfalls In Forest                                                                                 
  23094616      701000 Camila Cabello - First Man (LIVE at the 62nd GRAMMYs)                                                                           
  65010839      741000 Alan Walker, Sabrina Carpenter & Farruko - On My Way                                                                            
  56550661      767000 Drag Race: Formula E Car vs Cheetah                                                                                             
  56385391      880000 Coke Studio Season 12 | Wohi Khuda Hai                                                                                          

VIDEOVIEWS NO_OF_LIKES VIDEOTITLE                                                                                                                      
---------- ----------- --------------------------------------------------------------------------------------------------------------------------------
 151671688      911000 Seaworld SHAMU Killer Whale Show                                                                                                
  94029821      983000 Camila Cabello - Don't Go Yet (Official Video)                                                                                  
  11234302     1100000 I opened free 5 star hotels for poor                                                                                            
  28494371     1200000 Childhood Dreams | Aakash Gupta | Stand-up Comedy | Crowd Work                                                                  
  45332993     1500000 Taylor Swift ft. Chris Stapleton - I Bet You Think About Me (Taylor's Version)                                                  
 124158710     1700000 Camila Cabello - Bam Bam (Official Music Video) ft. Ed Sheeran                                                                  
  21175732     2000000 I Attended Spider-Man : No Way Home Premiere | Ashish Chanchlani | LA vlog                                                      
 408785205     3300000 Coke Studio Season 8| Tajdar-e-Haram| Atif Aslam                                                                                
 138831703     4000000 World’s Most Dangerous Escape Room!                                                                                             

86 rows selected.