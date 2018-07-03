##bmi : 체중 / 키^2
bmi <- function(weight,height){
  x <- weight%/%((height*0.01)^2)
  return(if(x>=35.0) "LEVEL 3 OVERWEIGHT" else
           if(x>=30.0) "LEVEL 2 OVERWEIGHT" else
             if(x>=25.0) "LEVEL 1 OVERWEIGHT" else
              if(x>=23.0) "BEFORE LEVEL OF OVERWEIGHT" else
                if(x<18.5) "LOW BODY WEIGHT" else "NORMAL")
}
bmi(sample(50:90,1,replace = TRUE),sample(168:188,1,replace = TRUE))
