m <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
m <- matrix(1:25, nrow = 5, ncol = 5, byrow = FALSE)
x <- c(1,2)
cat(x)
x <- append(x, 3)
cat(x)

n <- 1
for (i in 1:18)
{
  n <- n * 2
}
cat(n)

x=c()
x[1] = 1
cat(x)
for (i in 2:5)
{
  x[i] = i
}
cat(x)

# 1
# 2 3
# 4 5 6
# 7 8 910
#1112131415

mtxSelect <- function(s){
return(
switch(
toString(s),
"1" = rbind(matrix(c(1,0,0,0,0),nrow = 1,ncol = 5,byrow=TRUE),c(2,3,0,0,0),c(4,5,6,0,0),c(7,8,9,10,0),c(11,12,13,14,15)),
"2" = rbind(matrix(c(0,0,1,0,0),nrow = 1,ncol = 5,byrow=TRUE),c(0,2,3,4,0),c(5,6,7,8,9),c(0,10,11,12,0),c(0,0,13,0,0)),
"3" = rbind(matrix(c(1,2,3,4,5),nrow = 1,ncol = 5,byrow=TRUE),c(10,9,8,7,6),c(11,12,13,14,15),c(20,19,18,17,16),c(21,22,23,24,25))
))
}  
mtxSelect(2)
  
x <- c()
x[1] <- 1
cnt <- 1
for(i in 1:4)
{ 
  append(c(5*i:6*i),for(j in 1:4-i){})
}