##계산기
calc <- function(num1,op,num2){
  return(c(num1,op,num2,"=",switch(
                        op,
                        "+" = num1 + num2 ,
                        "-" = num1 - num2 ,
                        "*" = num1 * num2 ,
                        "/" = num1 %/% num2 ,
                        "%" = num1 %% num2
  )))
}
calc(sample(1:10,1,replace = TRUE),"+",sample(1:10,1,replace = TRUE))
