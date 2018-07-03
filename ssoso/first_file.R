help("solve")
?solve


#java : int a = 3
#System.out.println(a);
#script : java는 너무 복잡해

#a = 3
a <- 3
a
b <- 4
b
c <- a + b

a <- c(1,2,3,4)
a
a <- c(1,"2",3,"4")
a
#int[] arr = new int[4];
#arr[0] = 1, arr[1] = 2, arr[2] = 3, arr[3] = 4;
#arr <- c(1,2,3,4)
x <- c(1,2,3,4,5,6,7,8,9,10)
sum(x)
mean(x)
length(x)
sum((x-mean(x))^2)/(length(x)-1)

?seq
x <- seq(length=10,from = 1, by = 10)
x
x <- 15 : 20
x

sum(seq(length=100,from=1,by=1))

?sample
#가위 : 1 바위 : 2 보 : 3
#if-else
rps <- (com <- sample(1:3,1,replace = TRUE)) - (my <- 3)
if(rps == 0) print("무승부") else
  if(rps == 1 || rps == -2) print("패배") else print("승리")

#switch
rps <- toString((com <- sample(1:3,1,replace = TRUE)) - (my <- 3))
cat('컴퓨터 : ',com)
cat('결과 : ',rps)
x <- switch(
  rps,
  '0' = "무승부",
  '1' = "패배",
  '-2' = "패배",
  '2' = "승리",
  '-1' = "승리"
)
print(x)

#스칼라처리
print(switch(
  toString(sample(1:3,1,replace = TRUE) - 3),
  '0' = "무승부",
  '1' = "패배",
  '-2' = "패배",
  '2' = "승리",
  '-1' = "승리"
))

#BMI
h <- 180
w <- sample(50:100,1,replace = TRUE)
bmi <- w/(h*0.01)^2
if(bmi>=35.0) level <- "LEVEL 3 OVERWEIGHT" else
  if(bmi>=30.0) level <- "LEVEL 2 OVERWEIGHT" else
    if(bmi>=25.0) level <- "LEVEL 1 OVERWEIGHT" else
      if(bmi>=23.0) level <- "BEFORE LEVEL OF OVERWEIGHT" else
        if(bmi<18.5) level <- "LOW BODY WEIGHT" else level <- "NORMAL"
print(level)

#BMI
bmi <- (w <- sample(50:100,1,replace = TRUE))/((h <- (sample(158:187,1,replace = TRUE)))*0.01)^2
print( if(bmi>=35.0) "LEVEL 3 OVERWEIGHT" else
         if(bmi>=30.0) "LEVEL 2 OVERWEIGHT" else
          if(bmi>=25.0) "LEVEL 1 OVERWEIGHT" else
           if(bmi>=23.0) "BEFORE LEVEL OF OVERWEIGHT" else
            if(bmi<18.5) "LOW BODY WEIGHT" else "NORMAL")

#벡터만들기
print(
  c(1:10)
)
print(
  seq(from=1,to=10,by=2)
)
print(
  seq(from=1,length=10,by=2)
)
print(
  seq(1,10,2)
)
print(
  rep(1:5)
)
print(
  rep(1:5,each=2)
)
print(
  rep(1:5,times=2)
  )
print(
  rep(1:5,each=2,times=3)
)
print(
  rep(1:5,times=3,each=2,len=5)
)
print(
  rep(1:5,each=2,times=3,len=5)
)
#기본타입 : character, wide character, integer, floating point, double floating point, Boolean etc.
#R-Objects : Vector, List, Matrix, Array, Factor, Data Frame
#Vector 의 6개 타입
#Logical(T,F), Numeric(실수), Integer(정수), Complex(허수), Character(문자열), Raw(주소값)

#계산기
num1 <- 20
num2 <- 6
opcode <- '/'
cat(num1,opcode,num2,'=',switch(
  opcode,
  '+' = num1 + num2,
  '-' = num1 - num2,
  '*' = num1 * num2,
  '/' = num1 %/% num2,
  '%' = num1 %% num2
))


for(i in 1:(x <- 6)){
  if(i == x) cat(i,'=',sum(1:x)) else cat(i,'+ ')
}

x <- 0
for(i in 1:100){
  if(i == 100) cat(i,'=',sum(seq(1,100,2),(seq(2,100,2))*-1)) else
    if(i %% 2 == 0) cat(i,'+ ') else cat(i,'- ')
}

x <- 0
for(i in 1:100){
  if(i == 100) cat(i,'=',sum(seq(1,100,2),(seq(2,100,2))*-1)) else
  switch(
    toString(i%%2),
    '0' = cat(i,'+ '),
    '1' = cat(i,'- ')
  )
}
 
## stmt 를 합치면 function 이 된다.
## 4가지가 반드시 있어야 function 이 된다..R syntax
grade <- function(name,kor,eng,math){
  return (c(name, sum(c(kor,eng,math)), mean(c(kor,eng,math)) %/% 1,if(mean(c(kor,eng,math))<50) "F" else
                                    switch(
                                    toString(mean(c(kor,eng,math)) %/% 10),
                                        "10" = "A",
                                        "9" = "A",
                                        "8" = "B",
                                        "7" = "C",
                                        "6" = "D",
                                        "5" = "E" )))
}

res <- grade("Choi",sample(40:100,1,replace = TRUE),sample(40:100,1,replace = TRUE),sample(40:100,1,replace = TRUE))
cat(res)
cat("│   이   름     │ 총점  │ 평균  │ 학점  │\n")
cat("│   ",res[1],"     │ ",res[2]," │ ",res[3],"  │  ",res[4],"  │\n")

