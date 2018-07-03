grade <- function(name,kor,eng,math){
  return (list(name = name,sum = sum(c(kor,eng,math)),mean = mean(c(kor,eng,math)) %/% 1,grade = if(mean(c(kor,eng,math))<50) "F" else
    switch(
      toString(mean(c(kor,eng,math)) %/% 10),
      "10" = "A",
      "9" = "A",
      "8" = "B",
      "7" = "C",
      "6" = "D",
      "5" = "E" )))
}

name_list <- c()
kor_list <- c()
eng_list <- c()
math_list <- c()
sum_list <- c()
avg_list <- c()
grade_list <- c()

for(i in 1:5)
{
  kor <- sample(35:100,1,replace = TRUE)
  eng <- sample(35:100,1,replace = TRUE)
  math <- sample(35:100,1,replace = TRUE)
  x <- grade(sample(c("AA","BB","CC","DD","EE"),1,replace = FALSE),kor,eng,math)
  name_list[i] <- x$name
  kor_list[i] <- kor
  eng_list[i] <- eng
  math_list[i] <- math
  sum_list[i] <- x$sum
  avg_list[i] <- x$mean
  grade_list[i] <- x$grade
}

grade.data <- data.frame(
  g_name = name_list,
  g_kor = kor_list,
  g_eng = eng_list,
  g_math = math_list,
  g_sum = sum_list,
  g_avg = avg_list,
  g_grade = grade_list,
  stringsAsFactors = FALSE
)
print(grade.data)

res <- data.frame(grade.data$g_name,grade.data$g_sum)
print(res)

#pie(grade.data$g_avg,paste(grade.data$g_name,"(",(grade.data$g_avg/sum(c(grade.data$g_avg)))%/%0.01,"%)"))
#barplot(grade.data$g_avg,names.arg = paste(grade.data$g_name,"\n(", grade.data$g_avg,"점)"),xlab = "평균",ylab = "점수")


plot(c(grade.data[1,2],grade.data[1,3],grade.data[1,4],grade.data[1,6]), type="o", col="purple", ylim=range(0,100), axes=FALSE, ann=FALSE)
axis(1, at=1:4,c("국어","영어","수학","평균"))
axis(2, las=1, at=20*0:100) 
lines(c(grade.data[2,2],grade.data[2,3],grade.data[2,4],grade.data[2,6]), type = "o", col = "blue")
lines(c(grade.data[3,2],grade.data[3,3],grade.data[3,4],grade.data[3,6]), type = "o", col = "red")
lines(c(grade.data[4,2],grade.data[4,3],grade.data[4,4],grade.data[4,6]), type = "o", col = "pink")
lines(c(grade.data[5,2],grade.data[5,3],grade.data[5,4],grade.data[5,6]), type = "o", col = "green")
legend(1,30, c(grade.data[1,1],grade.data[2,1],grade.data[3,1],grade.data[4,1],grade.data[5,1]), cex=0.7, col=c("purple","blue","red","pink","green"),pch=21 ,lty=1:1)


##Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
# Print the data frame.			
print(emp.data) 










