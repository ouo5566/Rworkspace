## dplyr
# filter() 행추출
# select() 열추출
# arrange() 정렬
# mutate() 변수추가
# summarise() 통계치산출
# group_by() 집단별로 나누기
# left_join() 데이터합치기(열)
# bind_rows() 데이터합치기(행)
# View() 뷰어창에서 데이터 확인(v는 대문자)
library(ggplot2)

install.packages("dplyr")
library(dplyr)

path <- getwd() # wd : working directory
path
setwd("csv_exam")
df_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_exam
## 문자가 들어있는 파일을 불러올때는 stringAsFactors = F
## 를 넣어줄것. 지정하지 않으면 문자요소는 factor 로
## 전환 됨. 숫자는 전환 되지 않음

View(df_exam)
df_exam <- rename(df_exam, userid = id)

# 성적 평균, 등급 추가
df_exam$avg <- (df_exam$math + df_exam$english + df_exam$science) %/% 3
df_exam$grade <- ifelse(
  df_exam$avg >= 90, "A",
  ifelse(
    df_exam$avg >= 80, "B",
    ifelse(
      df_exam$avg >= 70, "C",
      ifelse(
        df_exam$avg >= 60, "D",
        ifelse(
          df_exam$avg >= 50, "E", "F"
        )
      )
    )
  )
)
qplot(df_exam$grade,xlab = "GRADE")
