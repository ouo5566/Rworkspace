##가위바위보 rock, paper, scissors
##A 승리, B 승리, 비김.

rps <- function(com,user){
  return(if(com == user) "DRAW" else
           if((com-user==-2)||(com-user==1)) "COM WIN" else "USER WIN")
}
rps(sample(1:3,1,replace = TRUE),sample(1:3,1,replace = TRUE))
