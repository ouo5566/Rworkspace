#구단별 승리수 SQL예제30번 : 바차트
df_win_count <- dbGetQuery(conn,
          "SELECT 
           A.WINNER TEAM_NAME,
           COUNT(A.WINNER) WIN_COUNT
           FROM(SELECT
           K.SCHE_DATE 경기날짜,
           CASE
           WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
           WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
           ELSE 'DRAW'
           END WINNER
           FROM SCHEDULE K
           JOIN TEAM HT
           ON K.HOMETEAM_ID LIKE HT.TEAM_ID
           JOIN TEAM AT
           ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
           WHERE
           K.GUBUN LIKE 'Y'
           AND K.SCHE_DATE LIKE '2012%'
           )A
           WHERE A.WINNER NOT LIKE 'DRAW'
           GROUP BY A.WINNER
           ORDER BY WIN_COUNT DESC
           ")
df_win_count
barplot(df_win_count$WIN_COUNT, names.arg = df_win_count$TEAM_NAME)
barplot(df_win_count[,2], names.arg = df_win_count[,1])

#스타디움 좌석수별 SQL예제29번 : 파이
df_seat_count <- dbGetQuery(conn,
"SELECT
    ROWNUM RANK,
    A.*
FROM(SELECT
        STADIUM_NAME STADIUM,
        SEAT_COUNT NSEAT
     FROM
        STADIUM
     ORDER BY SEAT_COUNT DESC) A")

df_seat_count
pie(df_seat_count$NSEAT,df_seat_count$STADIUM)

#점수차별 경기수 SQL예제28번 : 히스토그램
df_game_score <- dbGetQuery(conn,"
                            SELECT
                            K.SCHE_DATE SCHE_DATE,
                            HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME GAME,
                            CASE
                            WHEN K.HOME_SCORE >= K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
                            ELSE K.AWAY_SCORE - K.HOME_SCORE
                            END SCORE
                            FROM
                            SCHEDULE K
                            JOIN TEAM HT
                            ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                            JOIN TEAM AT
                            ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                            WHERE
                            K.SCHE_DATE LIKE '2012%'
                            AND K.GUBUN LIKE 'Y'
                            ORDER BY SCORE DESC")
df_game_score
hist(ylim = c(0,100),df_game_score$SCORE,xlab = "SCORE",ylab = "GAME_COUNT",main = "GAME_SCORE",col = "pink",border = "black")

#월별 게임수 SQL예제20번 : 산포도
df_game_month <- dbGetQuery(conn,"
                            SELECT
                            SUBSTR(SCHE_DATE,5,2) MONTH,
                            COUNT(SCHE_DATE) NGAME
                            FROM
                            SCHEDULE
                            WHERE
                            SCHE_DATE LIKE '2012%'
                            GROUP BY
                            SUBSTR(SCHE_DATE,5,2)
                            ORDER BY MONTH")
df_game_month
plot(x = df_game_month$MONTH,y = df_game_month$NGAME,
     xlab = "MONTH",
     ylab = "NGAME",
     xlim = c(1,12),
     ylim = range(0,df_game_month$NGAME,40),		 
     main = "DF_GAME_MONTH",axes=FALSE
)
axis(1, at=1:12)
axis(2, at=5*0:45)









#sql27 팀별 평균키
df_gk_height <- dbGetQuery(conn,"
                           SELECT
                           (SELECT TEAM_NAME
                           FROM TEAM
                           WHERE TEAM_ID LIKE T.TEAM_ID) TEAM,
                           ROUND(AVG(P.HEIGHT),2) HEIGHT
                           FROM TEAM T
                           JOIN PLAYER P
                           ON T.TEAM_ID LIKE P.TEAM_ID
                           GROUP BY T.TEAM_ID
                           ")
df_gk_height
plot(df_gk_height$HEIGHT, type="b", col="purple",ylim = range(169,df_gk_height$HEIGHT,181),frame = TRUE, axes=FALSE, ann=FALSE)
axis(1, at=1:15,df_gk_height$TEAM)
axis(2, las=1, at=1*0:181) 

plot(df_gk_height$HEIGHT, col="purple",ylim = range(150,df_gk_height$HEIGHT,181),frame = TRUE, axes=FALSE, ann=FALSE)
axis(1, at=1:15,df_gk_height$TEAM)
axis(2, las=1, at=5*150:181) 
