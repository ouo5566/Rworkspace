make_bar_chart <- function(x,names){
  return(barplot(x, names.arg = names))
}
make_bar_chart(df_win_count$WIN_COUNT,df_win_count$TEAM_NAME)
make_bar_chart(df_seat_count$NSEAT,df_seat_count$STADIUM)
?barplot
make_pie_chart <- function(x,names){
  return(pie(x,names))
}
make_pie_chart(df_seat_count$NSEAT,df_seat_count$STADIUM)
make_pie_chart(df_win_count$WIN_COUNT,df_win_count$TEAM_NAME)

make_hist_chart <- function(){
  return(hist(ylim = c(0,100),
              df_game_score$SCORE,
              xlab = "SCORE",
              ylab = "GAME_COUNT",
              main = "GAME_SCORE",
              col = "pink",
              border = "black"))
}



# SQL30 바차트 : 구단승리순으로 순위매기기
query = "SELECT A.WINNER,
COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
K.SCHE_DATE 경기날짜,
CASE
WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
ELSE '무승부'
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
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY WIN_COUNT DESC"
rs <- dbGetQuery(conn, query)
barplot(rs[,2],names.arg=rs[,1], main = "승리수")