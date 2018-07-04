install.packages("ggplot2") ## 처음 한 번 설치
library(ggplot2) ## import

read.csv(file = "C:\\Users\\1027\\eclipse\\jee-oxygen\\eclipse\\JeeWorkSpace\\Rworkspace\\2013년_전년대비_시간대별_교통사고_사망자_현황.csv")

## sample
x <- c("9","3","0","9","2","3")
x
qplot(x)
rm(x)

##
# manufacturer
# model model name
# displ engine displacement, in litres
# year year of manufacture
# cyl number of cylinders
# trans type of transmission
# drv f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# cty city miles per gallon
# hwy highway miles per gallon
# fl fuel type
# class "type" of car

# data - mpg, x축에 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)
# x축 cty
qplot(data = mpg, x = cty)

# 내가 모르는 데이터 파악방법
# mpg 데이터를 데이터 프레임으로 만든다.

mpg <- as.data.frame(ggplot2::mpg) ## 필수
head(mpg) ## 상위 5개의 데이터를 보여준다.
tail(mpg) ## 하위 5개의 데이터를 보여준다.
dim(mpg) ## dim : dimention 디멘션 = 행, 열 구조를 보여준다.
str(mpg) ## 컬럼의 타입을 보여준다.
summary(mpg) ## df에 대한 summary 를 보여준다.

# 데이터베이스 값은 함부로 바꿀 수 없다.
# 그러나 데이터프레임에서는 바꿔서 사용해도 된다.

# 통합 연비 변수 생성
mpg$total <- (mpg$cty + mpg$hwy) / 2
# 통합 연비 변수 평균
mean(mpg$total)
# 통합 연비 요약
summary(mpg$total)
hist(mpg$total)
# total 연비의 평균과 중앙값이 약 20이다.
# total 연비가 20 ~ 25 사이에 해당하는 자동차 모델이 가장 많다.
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.

# 합격 판정 변수 만들기
# total이 20 이상이면 pass 미만이면 fail 을 부여하는 test라는 변수를 생성
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
# 합격판정을 받은 자동차 수 살펴보기
table(mpg$test)
qplot(mpg$test,ylim = c(0,150))
# 중첩조건문
# total 30 이상이면 A, 20 이상이면 B, 20 미만이면 c
mpg$grade <- ifelse(
  mpg$total >= 30 , "A",
  ifelse(mpg$total >= 20, "B", "C")
)
table(mpg$grade)
qplot(mpg$grade)
# 중첩 한 번더 추가
mpg$grade <- ifelse(
  mpg$total >= 30 , "A",
  ifelse(mpg$total >= 25, "B",
         ifelse(mpg$total >= 20, "C", "D")
         )
)
# 변수명 변경 reshape 설
# mpg <- rename(mpg, company <- manufacturer)

# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1.  populator 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
head(midwest)
str(midwest)

# 1.  populator 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
# 변수명 변경없이 새로운 파생변수 생성
midwest$total <- midwest$poptotal
midwest$asian <- midwest$popasian

# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
midwest$asian_per<- (( midwest$asian / midwest$total ) * 100) %/%0.01 * 0.01
hist(ylim = range(0,midwest$asian_per,350),midwest$asian_per,xlab = "ASIAN_PER",ylab = "COUNTRY")

# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
mean(midwest$asian_per)
midwest$asian_flag <- ifelse(midwest$asian_per > mean(midwest$asian_per),"large","small")
qplot(midwest$asian_flag)

# 문제를 전부 푼 후 ...
# 변환된 데이터를 csv 파일로 저장합니다.
# 그러면 변형시킨 데이터를 csv를 통해 다른 프로그램
# 예를들면 엑셀이나 DB에 다시 전달할 수 있습니다.

write.csv(df_midterm, file = "update_midwest.csv")
